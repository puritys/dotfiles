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
      --javaImp ) JAVAIMP=true; shift 1 ;;
      --ctags ) CTAGS=true; shift 1 ;;
      -ujc | --updateJaveConfig ) UPDATE_JAVA_CONFIG=true; shift 1 ;;
      -k | --docker) DOCKER=true; shift 1;;
      -i | --init) INIT=true; installVimPlugin=1; shift 1;;
      --autoComplete) installYouCompleteMe=1; shift 1;;
      --cf) enableCustFont=1; shift 1;;
      -f | --fzf) installFZF=1; shift 1;;
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
        if [ ! -z $line ];then
            s=(${line//=/ });
            custEnv[${s[0]}]="${s[1]}"
        fi
        i=$(( $i + 1 ))
    done < $custEnvFile

fi


if [ "x" != "x$remoteHost" ]; then
    echo "Sync dotfiles to remote host $remoteHost"
    scp basic/.alias basic/.alias_common \
        basic/.bash_common basic/.bash_profile basic/.inputrc \
        basic/.bashrc bin/exec.sh basic/.vimrc basic/.vimrc_plugins \
        basic/.eclimrc basic/.screenrc $remoteHost:~/ 

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
cp basic/.* ~/
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
    mkdir ~/openjdk
    mv openjdk-7-fcs-src-b147-27_jun_2011.zip ~/openjdk/
    cd ~/openjdk && unzip openjdk-7-fcs-src-b147-27_jun_2011.zip
    cd -
fi

# JAVA settings
if [ ! -d "$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/" ];then
    mkdir -p $HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/;
fi
cp vim/javaPlugin/eclipse_config/org.eclipse.jdt.core.prefs.sh ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
pwd2="$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings"
sh $pwd2/org.eclipse.jdt.core.prefs.sh > $pwd2/org.eclipse.jdt.core.prefs
sudo cp vim/javaPlugin/google_checks.xml /usr/local/etc/
sudo cp vim/javaPlugin/checkstyle.xml /usr/local/etc/

# install eclim:
# http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
if [ "x$JAVA" != "x" ] || [ "x$UPDATE_JAVA_CONFIG" != "x" ]; then
    echo "If $HOME/.vim/eclipse is exists, skipping installing eclipse"
    if [[ `uname` == 'Darwin' ]]; then
        wgetPath=`which wget`
        if [ "x$wgetPath" == "x" ];then
            echo "You have to install wget"
            exit 1
        fi
        if [ ! -d $HOME/.vim/Eclipse.app ]; then
            #http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
            cd ~/ && wget http://mirror.rise.ph/eclipse/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-macosx-cocoa-x86_64.tar.gz
            if [ -d $HOME/.vim/eclipse ]; then rm -rf ~/.vim/eclipse; fi
            cd ~/ && tar -zxvf eclipse-jee-mars-2-macosx-cocoa-x86_64.tar.gz
            mv ~/Eclipse.app ~/.vim/
        fi

    else
        if [ ! -d $HOME/.vim/eclipse ]; then
            #http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
            fileId="1VEd_hsvWHcAJvcfP8lEv4vNTSCRkPCpl"
            wget --save-cookies=/tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" --output-document /tmp/g
            #confirmId=`curl -c /tmp/cookie -s -L "https://drive.google.com/uc?export=download&id=${fileId}" | grep -o "confirm=[^&]*" | sed 's/confirm=//'`
            confirmId=`cat /tmp/g | grep -o "confirm=[^&]*" | sed 's/confirm=//'`
            cd ~/ && wget --load-cookies=/tmp/cookie --no-check-certificate "https://drive.google.com/uc?export=download&confirm=${confirmId}&id=1VEd_hsvWHcAJvcfP8lEv4vNTSCRkPCpl" --output-document eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
            if [ -d $HOME/.vim/eclipse ]; then rm -rf ~/.vim/eclipse; fi
            cd ~/ && tar -zxvf eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
            mv ~/eclipse ~/.vim/
        fi
    fi


    cd $pwd
    cp vim/javaPlugin/eclim_settings ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclim.prefs
fi

cd $pwd
if [ "x$JAVA" != "x" ]; then
    #install Xvfb
    if [[ `uname` != 'Darwin' ]]; then
        sudo yum install xorg-x11-server-Xvfb gtk2 -y
    fi

    if [ -f "/usr/share/X11/xkb/symbols/inet" ]; then
        sudo sed 's/\/\/zz//' -i /usr/share/X11/xkb/symbols/inet
        sudo sed 's/key <FK20>.*XF86AudioMicMute/\/\/zzkey <FK20> {[XF86AudioMicMute/' -i /usr/share/X11/xkb/symbols/inet
    fi
    ps aux |grep -i Xvfb |grep -v grep | awk '{printf "kill -9 %s\n",$2}' | sudo sh
    export DISPLAY=:1

    if [[ `uname` != 'Darwin' ]]; then
        echo "\n\n=== Start Xvfb ===\n\n"
        sudo Xvfb :1 -screen 0 1024x768x24 &
    fi
    echo "\n\n=== Start eclipse ===\n\n"
    if [ `uname` == 'Darwin' ]; then
        open ~/.vim/Eclipse.app
        echo "\n\n=== Install eclim ===\n\n"
        java -Dvim.files=$HOME/.vim  -Declipse.home=$eclipseHome  -jar ./vim/javaPlugin/eclim_2.6.0.jar install

    else
        DISPLAY=:1 ~/.vim/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director   -repository http://download.eclipse.org/releases/juno      -installIU org.eclipse.wst.web_ui.feature.feature.group &
        sleep 5
        echo "\n\n=== Install eclim ===\n\n"
        java -Dvim.files=$HOME/.vim  -Declipse.home=$HOME/.vim/eclipse/  -jar ./vim/javaPlugin/eclim_2.6.0.jar install

    fi
    sleep 25


    #echo "\n\n=== Start eclimd ===\n\n"
    # log ~/workspace/.metadata/.log
    DISPLAY=:1 $eclipseHome/eclimd -b
    sleep 20


    # :ProjectCreate ./ -n java
    # :ProjectList
    # :ProjectDelete xxx
    # mvn dependency:resolve (update classpath)
fi
if [ ! -d ~/.eclim/ ];  then mkdir ~/.eclim/; fi

if [ "x$INIT" != "x" ] || [ "x$installFZF" != "x" ];  then
    if [ ! -d ~/.sh_tool ]; then
        mkdir ~/.sh_tool
        git clone --depth 1 git@github.com:junegunn/fzf.git ~/.sh_tool/fzf
        ~/.sh_tool/fzf/install --all
        ## append
        #  <(cat ~/machine_list.txt | command grep -v '#' | sed -e 's/^/host /') \ 
        #  to ~/.sh_tool/fzf/shell/completion.bash : _fzf_complete_ssh


        # ------------
        # Install fasd cd
        # ------------
        if [ "x" = "x`command -v wget`" ]; then
            if [ "x" != "x`command -v yum`" ]; then
                sudo yum install -y wget
            fi
        fi
        cd ~/.sh_tool/ ; wget https://github.com/clvv/fasd/tarball/1.0.1
        tar -zxvf 1.0.1
        cd clvv-fasd-4822024; PREFIX=$HOME make install
        cd ../../
    fi

    ## Basic package
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y screen tmux
    elif [[ `uname` == 'Darwin' ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
        brew install tmux
    fi

    # -----------
    # Install ag
    # -----------
    echo -e "Install ag \n"
    if [ "x" == "x`command -v /usr/local/bin/ag`" ]; then
        installedAg=0
        if [ -f /etc/redhat-release ]; then
            v=`cat /etc/redhat-release`
            if [[ "$v" == *"7."* ]]; then
                sudo yum install -y the_silver_searcher
                installedAg=1
            fi
        elif [[ `uname` == 'Darwin' ]]; then
            brew install the_silver_searcher
            installedAg=1;
        fi
        if [ "x0" == "x$installedAg" ];then
            git clone https://github.com/ggreer/the_silver_searcher.git
            cd the_silver_searcher
            ./build.sh
            make
            sudo make install
            cd ..
        fi
    fi 
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

content=""
for key in "${custEnvList[@]}"
do
    content="\n$key=${custEnv[$key]}"
done
echo -e $content > $custEnvFile
