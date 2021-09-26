if [ "x" = "x`command -v openssl`" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y openssl
    else
        git clone https://github.com/openssl/openssl.git
        cd openssl
        ./Configure --prefix=/usr/local
        make
        make install
    fi
fi
