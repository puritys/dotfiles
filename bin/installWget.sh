if [ "x" = "x`command -v wget`" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y wget
    else
        #source ./installPkgConfig.sh
        #source ./installOpenssl.sh
        ##curl -k "https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz" -o wget.tar.gz
        ##curl -k "https://ftp.gnu.org/gnu/wget/wget-1.21.tar.gz" -o wget.tar.gz
        #tar -zxvf wget.tar.gz
        #cd wget-*
        #./configure --prefix=/usr/local --with-openssl
        #make
        #sudo make install
        brew install tmux
    fi
fi
