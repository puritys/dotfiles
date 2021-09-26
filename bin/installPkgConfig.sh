if [ "x" = "x`command -v pkg-config`" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y pkg-config
    else
        curl -k "https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz" -o pkg-config.tar.gz
        tar -zxvf pkg-config.tar.gz
        cd pkg-config-*
        ./configure --prefix=/usr/local
        make
        sudo make install
    fi
fi
