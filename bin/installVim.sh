sudo yum install  -y ncurses-devel
if [ ! -f vim.tar.gz ]; then
    wget https://github.com/vim/vim/archive/v8.2.3401.tar.gz
    mv v8.2.3401.tar.gz vim.tar.gz
fi
tar -zxvf vim.tar.gz 
mv `ls -D |grep 'vim-[0-9]' | sed 's/\///'` vim_src
cd vim_src
./configure ./configure --prefix=/usr  --enable-multibyte \
         --enable-pythoninterp=yes --with-python2-config-dir=/usr/bin/ \
        --enable-python3interp=yes --with-python3-config-dir=/usr/bin/
gmake
sudo gmake install
