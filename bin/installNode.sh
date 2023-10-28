if [ `uname` == "Linux" ]; then
    if [ ! -f node-v16.14.0-linux-x64.tar.xz ];then
        wget https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz
    fi
    sudo mkdir -p /usr/lib/node_modules/
    tar -xf node-v16.14.0-linux-x64.tar.xz
    sudo cp node-v16.14.0-linux-x64/bin/* /usr/bin/
    sudo cp -fr node-v16.14.0-linux-x64/lib/node_modules/* /usr/lib/node_modules/
    sudo chmod 755 /usr/bin/npm /usr/bin/node
    sudo chmod -R 755 /usr/lib/node_modules/npm
elif [ "x" != "x`command -v yum`" ]; then
    curl -sL https://rpm.nodesource.com/setup_17.x | sudo bash -
    sudo yum install nodejs -y
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc
    nvm install 16
    nvm use 16
fi
