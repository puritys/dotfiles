sudo yum install screen vim git wget telnet

acount=`whoami`
# install node
mkdir -p ~/bin
wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.xz ~/bin
cd ~/bin
tar -xvf node-v8.9.4-linux-x64.tar.xz
sudo ln -sf /home/$account/bin/node-v8.9.4-linux-x64/bin/node /usr/bin/node
sudo ln -sf /home/$account/bin/node-v8.9.4-linux-x64/bin/npm /usr/bin/npm
