sudo yum install  -y ncurses-devel
wget https://github.com/vim/vim/archive/v7.4.2367.tar.gz
tar -zxvf v7.4.2367.tar.gz 
cd vim-7.4.2367
./configure --enable-multibyte --enable-pythoninterp=yes --prefix=/usr --with-x --x-includes=/usr/include/X11/ --x-libraries=/usr/lib64/
gmake
sudo gmake install
