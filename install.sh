touch ~/.bash_host
cp basic/.* ~/

# .vim style
cp -rT vim ~/.vim

# ssh
mkdir ~/.ssh
cp ssh/* ~/.ssh/
chmod 400 ~/.ssh/config
