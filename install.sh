#!/bin/bash

while true; do
    if [ "x$1" == "x" ];then
        break;
    fi  
    case "$1" in
      -p | --vimPlugin   ) installVimPlugin=1; shift 1 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -j | --jave ) JAVA=true; shift 1 ;;
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


