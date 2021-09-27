source ./installWget.sh
if [[ `uname` == 'Darwin' ]]; then
    echo "Darwin ok"
else
    sudo yum install  -y ncurses-devel
fi
if [ ! -f vim.tar.gz ]; then
    wget https://github.com/vim/vim/archive/v8.2.3401.tar.gz
    mv v8.2.3401.tar.gz vim.tar.gz
fi
tar -zxvf vim.tar.gz
if [[ `uname` == 'Darwin' ]]; then
    mv `ls |grep 'vim-[0-9]' | sed 's/\///'` vim_src
else
    mv `ls -D |grep 'vim-[0-9]' | sed 's/\///'` vim_src
fi
cd vim_src
./configure ./configure --prefix=/usr/local  --enable-multibyte \
         --enable-pythoninterp=yes --with-python2-config-dir=/usr/bin/ \
        --enable-python3interp=yes --with-python3-config-dir=/usr/bin/ \
        --enable-termtruecolor
make
sudo make install
