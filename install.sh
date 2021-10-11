#!/bin/bash
installYouCompleteMe=0

while true; do
    if [ "x$1" == "x" ];then
        break;
    fi
    case "$1" in
      -p | --vimPlugin   ) installVimPlugin=1; shift 1 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -j | --jave ) JAVA=true; shift 1 ;;
      --installVim ) INSTALL_VIM=true; shift 1 ;;
      --installJava ) INSTALL_JAVA=true; shift 1 ;;
      --javaImp ) JAVAIMP=true; shift 1 ;;
      --ctags ) CTAGS=true; shift 1 ;;
      --installNode ) INSTALL_NODE=true; shift 1 ;;
      -ujc | --updateJaveConfig ) UPDATE_JAVA_CONFIG=true; shift 1 ;;
      -k | --docker) DOCKER=true; shift 1;;
      -i | --init) INIT=true; installVimPlugin=1; shift 1;;
      --autoComplete) installYouCompleteMe=1; shift 1;;
      --cf) enableCustFont=1; shift 1;;
      -f | --fzf) installFZF=1; shift 1;;
      --tmux) installTmux=1; shift 1;;
      -b | --bashIt) installBashIt=1; shift 1;;
      --host) remoteHost=$2; shift 2;;
      -h | --help  )
          echo "Usage:"
          echo "-p: install docfiles and vim plugin"
          echo "-k: install docker alias"
          echo "-j: install docfiles and some vim plugins for java, eclipse"
          echo "-i: install docfiles and vim plugins"
          echo "--host: install dotfiles to remote host."
          shift 1
          exit 1
          ;;
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done

source ./bin/installWget.sh

custEnvList="enableCustFont"
custEnvList=(${custEnvList// / });
custEnvFile="$HOME/.custEnv"
declare -a custEnv
if [ ! -f $custEnvFile ]; then
    touch $custEnvFile
else
    i=0;
    while read line
    do
        if [ ! -z $line ] && [ $line != "-e" ];then
            s=(${line//=/ });
            custEnv[${s[0]}]="${s[1]}"
        fi
        i=$(( $i + 1 ))
    done < $custEnvFile

fi


if [ "x" != "x$remoteHost" ]; then
    echo "Sync dotfiles to remote host $remoteHost"
    scp basic/alias basic/alias_common \
        basic/.bash_common basic/.bash_profile basic/.inputrc \
        basic/.bashrc bin/exec.sh basic/.vimrc basic/.vimrc_plugins basic/.vimrc_keymaps basic/.vimrc_lib \

    ssh $remoteHost " \
        sudo mv exec.sh /usr/local/bin/myExec.sh; mkdir -p ~/.vim/plugged/vim-snipmate/snippets/; \
        if [ ! -f ~/.vim/autoload/plug.vim ]; then \
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
        fi"

    scp vim-snipmate/*.snippets $remoteHost:~/.vim/plugged/vim-snipmate/snippets/
    scp -r vim/colors vim/autoload vim/plugin $remoteHost:~/.vim/
    scp -r ~/.vim/plugged $remoteHost:~/.vim/
    exit 1
fi

# Remove legacy
rm -f ~/.vim/.vimrc_pluginSettings
rm -rf ~/.sh_tool/z/

touch ~/.bash_host
cp config/coc-settings.json ~/.vim/
cp config/coc-settings.json ~/.config/nvim/

#
# Copy all dotfiles
#
files=($(ls basic))
for(( i=0; i<${#files[@]}; i++ ))
do
    file=basic/${files[i]}
    newFile=".${files[i]}"
    echo "copy $file to $newFile"
    cp $file ~/$newFile
done
mkdir -p ~/.config/nvim/
cp nvim/init.vim ~/.config/nvim/

pwd=`pwd`
if hash sudo 2>/dev/null; then
    sudo="sudo "
else
    sudo=""
fi

# .vim style
eclipseHome=$HOME/.vim/eclipse
if [[ `uname` == 'Darwin' ]]; then
    cp -R vim/ ~/.vim
    eclipseHome=$HOME/.vim/Eclipse.app/Contents/Eclipse
else
    cp -rT vim ~/.vim
fi

echo $DOCKER
if [ "x$DOCKER" == "x" ];then
    echo "Without docker"
    rm -f ~/.alias_docker
else
    if [ -d /usr/local/bin/ ]; then
        sudo cp bin/docker_php /usr/local/bin/php
        sudo cp bin/docker_php7 /usr/local/bin/php7
        sudo cp bin/docker_php7_composer /usr/local/bin/php7_composer

        sudo chmod 755 /usr/local/bin/php /usr/local/bin/php7 /usr/local/bin/php7_composer
    fi

fi

# ------------------
# Install My command
# ------------------
sudo cp bin/exec.sh  /usr/local/bin/myExec.sh
sudo mkdir -p /usr/local/bin/puritys/
sudo cp bin/*.pl  /usr/local/bin/puritys/
sudo cp bin/*.sh  /usr/local/bin/puritys/
sudo cp bin/appendJavaClasspath.sh /usr/local/bin/

installTmux () {

    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y screen tmux
        ## install the latest tmux
        version=3.0
        sudo yum install -y gcc kernel-devel make ncurses-devel libevent-devel
        wget https://github.com/tmux/tmux/releases/download/$version/tmux-$version.tar.gz
        tar -xvzf tmux-$version.tar.gz
        cd tmux-$version
        LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/
        make
        sudo make install
        rm -rf tmux*
    elif [[ `uname` == 'Darwin' ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
        brew install tmux
    fi


}

installFzf () {
    if [ ! -d ~/.sh_tool ]; then
        mkdir ~/.sh_tool
        git clone --depth 1 git@github.com:junegunn/fzf.git ~/.sh_tool/fzf
        ~/.sh_tool/fzf/install --all
        ## append
        #  <(cat ~/machine_list.txt | command grep -v '#' | sed -e 's/^/host /') \
        #  to ~/.sh_tool/fzf/shell/completion.bash : _fzf_complete_ssh
        ### new version of fzf
        # ~/.vim/plugged/fzf/shell/completion.bash
    fi
    if [ ! -d ~/.sh_tool/clvv-fasd-4822024 ]; then
        # ------------
        # Install fasd cd
        # ------------
        cd ~/.sh_tool/ ; wget https://github.com/clvv/fasd/tarball/1.0.1
        tar -zxvf 1.0.1
        cd clvv-fasd-4822024; PREFIX=$HOME make install
        cd ../../
    fi

}

installAg() {
    echo -e "Install ag \n"
    if [ "x" == "x`command -v /usr/local/bin/ag`" ]; then
        installedAg=0
        if [ -f /etc/redhat-release ]; then
            v=`cat /etc/redhat-release`
            if [[ "$v" == *"7."* ]]; then
                resp=`sudo yum install -y the_silver_searcher 2>&1`
                if [[ $resp == *"Nothing to do"* ]]; then
                    echo "could not use yum to install silver search"
                else
                    installedAg=1
                fi
            fi
        elif [[ `uname` == 'Darwin' ]]; then
            brew install the_silver_searcher
            installedAg=1;
        fi
        if [ "x0" == "x$installedAg" ] && [ "x" != "x`command -v yum`" ];then
            sudo yum install automake pcre-devel xz-devel zlib-devel -y
            if [ ! -d the_silver_searcher ]; then
                git clone https://github.com/ggreer/the_silver_searcher.git
            fi
            cd the_silver_searcher
            ./build.sh
            make
            sudo make install
            cd ..
        fi
    fi

}

installVim () {
    wget https://github.com/vim/vim/archive/v8.1.1317.tar.gz
    tar -zxvf v8.1.1317.tar.gz
    mv vim-8.1.1317 vim_src;
    cd vim_src
         ./configure --enable-multibyte --enable-pythoninterp=yes --prefix=/usr; \
        gmake
        sudo gmake install
    cd -
    rm -rf v8*.gz
}

if [ ! -d /tmp/fzf_session ]; then
    mkdir -p /tmp/fzf_session
fi

# Install youCompleteMe
if [ "x$installYouCompleteMe" == "x1" ]; then
if [ ! -d ~/.vim/plugged/YouCompleteMe ]; then
    echo "Install YouCompleteMe: need cmake and python-devel-2.7 or 3 "
    if [ -f /usr/bin/yum ];then
        sudo yum -y install cmake python-devel
    #    sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
    #    sudo yum install build-essential cmake python-devel python3-devel
    fi
    git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
    cd ~/.vim/plugged/YouCompleteMe
    git submodule update --init --recursive
    python2 ./install.py --clang-completer # or --all  --clang-completer --gocode-completer --java-completer
fi
fi


# Install vim Plugin
if [ "x$installVimPlugin" != "x" ];then

    if [ -d ~/.vim/bundle ]; then
        $sudo rm -rf ~/.vim/bundle
        $sudo rm -rf ~/.vim/.vimrc_vundle
    fi

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    sudo rm -rf ~/.vim/plugged/vim-snipmate/
    echo "\n" | vim -c :PlugInstall +qall

    # install coc plugin
    if [ "x" != "x`command -v npm`" ]; then
        mkdir -p ~/.config/coc/extensions;
        sudo chmod -R 755 ~/.config/coc/extensions;
        cd ~/.config/coc/extensions;
            npm install coc-tabnine coc-snippets coc-java coc-groovy coc-tsserver coc-go coc-word coc-phpls coc-pyright --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod;
            # Manually download tabnine and fix permission
            # - https://update.tabnine.com/bundles/3.7.5/x86_64-unknown-linux-musl/TabNine.zip
            # - sudo chmod -R 755 ~/.config/coc/extensions/coc-tabnine-data/
        cd -
    fi
fi


# Update snippet script
if [ ! -d ~/.vim/plugged/vim-snipmate/snippets ]; then
    mkdir -p ~/.vim/plugged/vim-snipmate/snippets
fi

$sudo rm -f ~/.vim/plugged/vim-snipmate/snippets/*

cp vim-snipmate/*.snippets ~/.vim/plugged/vim-snipmate/snippets/

# install google java code format
if [ -d /usr/local/lib/ ]; then
    if [ ! -f /usr/local/lib/google-java-format-1.4-all-deps.jar ]; then
        sudo cp vim/javaPlugin/google-java-format-1.4-all-deps.jar /usr/local/lib/
    fi
fi


# install  JavaImp
# http://www.vim.org/scripts/script.php?script_id=325
# Java JDK http://download.java.net/openjdk/jdk7/promoted/b147/openjdk-7-fcs-src-b147-27_jun_2011.zip
downloadOpenJdk=0
if [ "x$JAVA" != "x" ] && [ ! -d "$HOME/openjdk" ]; then
    downloadOpenJdk=1
fi
if [ "x$JAVAIMP" != "x" ] && [ ! -d "$HOME/openjdk" ]; then
    downloadOpenJdk=1
fi
if [ "x$downloadOpenJdk" == "x1" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install unzip -y
    fi
    wget http://download.java.net/openjdk/jdk7/promoted/b147/openjdk-7-fcs-src-b147-27_jun_2011.zip
    mkdir ~/.vim/JavaImp
    cp config/JavaImp/* ~/.vim/JavaImp/
    mkdir ~/openjdk
    mv openjdk-7-fcs-src-b147-27_jun_2011.zip ~/openjdk/
    cd ~/openjdk
        unzip openjdk-7-fcs-src-b147-27_jun_2011.zip
        mv openjdk/jdk/src/share/classes/ ./
        rm -rf openjdk
        rm openjdk-7-fcs-src-b147-27_jun_2011.zip
    cd -
fi

# JAVA settings
if [ ! -d "$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/" ];then
    mkdir -p $HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/;
fi
cp vim/javaPlugin/eclipse_config/*.sh ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
pwd2="$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings"
sh $pwd2/org.eclipse.jdt.core.prefs.sh > $pwd2/org.eclipse.jdt.core.prefs
sh $pwd2/org.eclipse.jdt.apt.core.prefs.sh > $pwd2/org.eclipse.jdt.apt.core.prefs
sudo mkdir -p /usr/local/etc/
sudo cp vim/javaPlugin/google_checks.xml /usr/local/etc/
sudo cp vim/javaPlugin/checkstyle.xml /usr/local/etc/

source ./scripts/installCommonCommand.sh

if [ "x$installFZF" != "x" ];  then
    installFzf
fi

if [ "x$INIT" != "x" ];  then
    ## Basic package
    installFzf
    installTmux
    installAg
fi

if [ "x$installBashIt" != "x" ];  then

    # ------------
    # Install bash-it
    # ------------

    git clone --depth=1 git@github.com:Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --no-modify-config --silent

    export BASH_IT="$HOME/.bash_it"
    source "$BASH_IT"/bash_it.sh
    complete="bash-it,defaults,dirs,docker,virtualbox,ssh,pip,pip3,makefile,git,git_flow,docker-machine,brew,export,maven,npm"
    complete=(${complete//,/ });
    for(( i=0; i<${#complete[@]}; i++ ))
    do
        line=${complete[$i]}
        bash-it enable completion $line
    done

    plugin="ssh,dirs,java,node"
    plugin=(${plugin//,/ });
    for(( i=0; i<${#plugin[@]}; i++ ))
    do
        line=${plugin[$i]}
        bash-it enable plugin $line
    done

    bash-it disable alias all
fi


# -------------------------------
# Install ctags for auto complete
# -------------------------------
if [ "x" != "x$CTAGS" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y ctags
    fi
    if [ -d /www ];then
        cd /www
        ctags -R --fields=+laimS --languages=php -f ~/.vim/php_tags  -a
        cd -
    fi
    cd ~/
    ctags -R --fields=+laimS --languages=php -f ~/.vim/php_tags  -a
    cd -

fi

if [ ! -z $enableCustFont ]; then
    custEnv["enableCustFont"]="1"
fi

if [ ! -z $INSTALL_VIM ] && [ true == "$INSTALL_VIM" ];then
    installVim
fi

if [ 1 == "$installTmux" ];then
    installTmux
fi

content=""
for key in "${custEnvList[@]}"
do
    if [ ! -z ${custEnv[$key]} ]; then
        content="\n$key=${custEnv[$key]}"
    fi
done
OS=$(uname -s)
if [[ X"$OS" == X"Darwin" ]]; then
    echo $content > $custEnvFile
else
    echo -e $content > $custEnvFile
fi
