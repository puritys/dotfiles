#!/bin/bash

while true; do
    if [ "x$1" == "x" ];then
        break;
    fi  
    case "$1" in
      -p | --vimPlugin   ) installVimPlugin=1; shift 1 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -j | --jave ) JAVA=true; shift 1 ;;
      -ujc | --updateJaveConfig ) UPDATE_JAVA_CONFIG=true; shift 1 ;;
      -k | --docker) DOCKER=true; shift 1;;
      -h | --help  ) 
          echo "Usage:"
          echo "-p: install vim plugin"
          echo "-k: install docker alias"
          echo "-j: install some vim plugins for java"
          shift 1
          exit 1 
          ;;  
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done

touch ~/.bash_host
cp basic/.* ~/

if hash sudo 2>/dev/null; then
    sudo="sudo "
else
    sudo=""
fi

# .vim style
if [[ `uname` == 'Darwin' ]]; then
    cp -R vim/ ~/.vim
else 
    cp -rT vim ~/.vim
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo $DOCKER
if [ "x$DOCKER" == "x" ];then
    echo "Without docker"
    rm -f ~/.alias_docker
fi

if [ "x$installVimPlugin" != "x" ];then
    $sudo rm -rf ~/.vim/bundle/vim-snipmate/
    vim -c :PluginInstall +qall &>/dev/null
fi

if [ ! -d ~/.vim/bundle/vim-snipmate/snippets ]; then
    mkdir -p ~/.vim/bundle/vim-snipmate/snippets
fi

$sudo rm -f ~/.vim/bundle/vim-snipmate/snippets/*


cp vim-snipmate/*.snippets ~/.vim/bundle/vim-snipmate/snippets/


# install  JavaImp
# http://www.vim.org/scripts/script.php?script_id=325
# Java JDK http://download.java.net/openjdk/jdk7/promoted/b147/openjdk-7-fcs-src-b147-27_jun_2011.zip

if [ "x$JAVA" != "x" ]; then
    wget http://download.java.net/openjdk/jdk7/promoted/b147/openjdk-7-fcs-src-b147-27_jun_2011.zip
    mkdir ~/.vim/JavaImp
    mkdir ~/openjdk
    mv openjdk-7-fcs-src-b147-27_jun_2011.zip ~/openjdk/
    cd ~/openjdk && unzip openjdk-7-fcs-src-b147-27_jun_2011.zip
fi

# install eclim: 
# http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
if [ "x$JAVA" != "x" ] || [ "x$UPDATE_JAVA_CONFIG" != "x" ]; then
    # Add hostname into /etc/hosts. e.g. 127.0.0.1 xxxHost
    #cd ~/ && wget xx
    #if [ -d ~/.vim/eclipse ]; then rm -rf ~/.vim/eclipse; fi
    #cd ~/ && tar -zxvf eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
    #mv ~/eclipse ~/.vim/
    if [ ! -d "$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/" ];then
        mkdir $HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/;
    fi

    cp vim/javaPlugin/eclim_settings ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclim.prefs
    cp vim/javaPlugin/eclipse_config/org.eclipse.jdt.core.prefs.sh ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
    pwd="$HOME/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings"
    sh $pwd/org.eclipse.jdt.core.prefs.sh > $pwd/org.eclipse.jdt.core.prefs
    sudo cp vim/javaPlugin/google_checks.xml /usr/local/etc/
    sudo cp vim/javaPlugin/checkstyle.xml /usr/local/etc/
fi

if [ "x$JAVA" == "xxxx" ]; then
    ps aux |grep -i Xvfb |grep -v grep | awk '{printf "kill -9 %s\n",$2}' | sudo sh
    export DISPLAY=:1
    echo "\n\n=== Start Xvfb ===\n\n"
    sudo Xvfb :1 -screen 0 1024x768x24 &

    echo "\n\n=== Start eclipse ===\n\n"
    DISPLAY=:1 ~/.vim/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director   -repository http://download.eclipse.org/releases/juno      -installIU org.eclipse.wst.web_ui.feature.feature.group &
    sleep 25


    #echo "\n\n=== Install eclim ===\n\n"
    #java -Dvim.files=$HOME/.vim  -Declipse.home=$HOME/.vim/eclipse/  -jar ./vim/javaPlugin/eclim_2.6.0.jar install

    #echo "\n\n=== Start eclimd ===\n\n"
    #DISPLAY=:1 ~/.vim/eclipse/eclimd -b
    #sleep 20


    # :ProjectCreate ./ -n java
    # :ProjectList
    # :ProjectDelete xxx
    # mvn dependency:resolve (update classpath)
fi
if [ ! -d ~/.eclim/ ];  then mkdir ~/.eclim/; fi


