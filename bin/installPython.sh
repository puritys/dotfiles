# Install Python 3.9
if [ "x" != "x`command -v yum`" ]; then
    sudo yum install python39 -y
else
    if [ ! -f /usr/bin/python3 ] || [ ! -f /usr/usr/bin/python3 ] ;then
        if [ ! -f Python-3.9.0.tgz ];then
            wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
            tar -zxvf Python-3.9.0.tgz
        fi
        cd Python-3.9.0
        ./configure --prefix=/usr --enable-shared
        make
        sudo make install
        wget https://bootstrap.pypa.io/get-pip.py
        sudo /usr/bin/python3.9 get-pip.py
        #sudo pip3.9 install xxx
        cd ../
    fi
fi

# Intsall Python 2.7
if [ ! -f /usr/local/bin/python2.7 ];then

    if [ ! -f Python-2.7.14.tar.xz ];then
        wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
        tar -xvf Python-2.7.14.tar.xz
    fi

    cd Python-2.7.14
    ./configure --prefix=/usr/local/share/python2.7 --enable-unicode=ucs4
    make
    sudo make install
    sudo ln -sf /usr/local/share/python2.7/bin/python2.7  /usr/local/bin/python2
    sudo ln -sf /usr/local/share/python2.7/bin/python2.7  /usr/local/bin/python2.7

    python setup.py install
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python2.7 get-pip.py
    #sudo python2.7 /usr/bin/pip2 install xxx
    cd ../
fi
