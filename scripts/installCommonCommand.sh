
if [ ! -z $INSTALL_JAVA ] && [ true == $INSTALL_JAVA ];then
    sudo yum install java-1.8.0-openjdk-devel -y
fi

if [ ! -z $INSTALL_NODE ] &&  [ true == $INSTALL_NODE ];then
    if [ ! -d node ]; then
        sudo mkdir -p /usr/local/lib/node_modules
        if [ -f /usr/local/bin/npm ]; then
            sudo rm -f /usr/local/bin/npm
        fi
        if [ -f /usr/bin/npm ]; then
            sudo rm -f /usr/bin/npm
        fi
        if [ -f /usr/local/bin/node ]; then
            sudo rm -f /usr/local/bin/node
        fi
        if [ -f /usr/bin/node ]; then
            sudo rm -f /usr/bin/node
        fi
        wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz
        tar -xf node-v10.16.0-linux-x64.tar.xz 
        mv node-v10.16.0-linux-x64 node
        sudo cp -r node/lib/node_modules/npm/ /usr/local/lib/node_modules/npm
        sudo cp node/bin/npm  /usr/local/bin/
        sudo cp node/bin/node  /usr/local/bin/
        sudo ln -sf  /usr/local/lib/node_modules/npm/bin/npm-cli.js  /usr/local/bin/npm
        rm -rf node node*.xz

    fi
fi

