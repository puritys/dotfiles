touch ~/.bash_host
cp basic/.* ~/

# .vim style
if [[ `uname` == 'Darwin' ]]; then
    cp -R vim/ ~/.vim
else 
    cp -rT vim ~/.vim
fi



# ssh
#mkdir ~/.ssh
#cp ssh/* ~/.ssh/
#chmod 400 ~/.ssh/config
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


if [ ! -d ~/.vim/bundle/vim-snipmate/snippets ]; then
    mkdir -p ~/.vim/bundle/vim-snipmate/snippets
fi
sudo rm ~/.vim/bundle/vim-snipmate/snippets/*
cp vim-snipmate/*.snippets ~/.vim/bundle/vim-snipmate/snippets/

