touch ~/.bash_host
cp basic/.* ~/

# .vim style
if [[ `uname` == 'Darwin' ]]; then
    cp -R vim/ ~/.vim
else 
    cp -rT vim ~/.vim
fi



# ssh
mkdir ~/.ssh
cp ssh/* ~/.ssh/
chmod 400 ~/.ssh/config


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
