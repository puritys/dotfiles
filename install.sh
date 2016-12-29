#!/bin/bash
touch ~/.bash_host
cp basic/.* ~/

if hash sudo 2>/dev/null; then
    sudo="sudo "
else
    sudo=""
fi

while true; do
    if [ "x" == "x" ];then
        break;
    fi  
    case "" in
      -p | --vimPlugin   ) installVimPlugin=1; shift 1 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -h | --help  ) 
          echo "Usage:"
          echo "-p: install vim plugin"
          shift 1 
          ;;  
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo " is not a correct option.";shift 1; ;;
    esac
done

installVimPlugin=$1
# .vim style
if [[ `uname` == 'Darwin' ]]; then
    cp -R vim/ ~/.vim
else 
    cp -rT vim ~/.vim
fi



if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

