wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
tar -zxvf Python-3.5.0.tgz
cd Python-3.5.0
./configure --prefix=/usr/local/share/python3.5
gmake
sudo gmake install
wget https://bootstrap.pypa.io/get-pip.py
sudo /usr/local/bin/python3.5 get-pip.py 
#sudo pip3.5 install xxx

# Intsall Python 2.7
wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
tar -xvf Python-2.7.14.tar.xz
cd Python-2.7.14
./configre --prefix=/usr/local/share/python2.7 --enable-unicode=ucs4
gmake 
sudo gmake
sudo ln -sf /usr/local/share/python2.7/bin/python2.7 /usr/local/bin/python2.7
python setup.py install
wget https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py
#sudo python2.7 /usr/bin/pip2 install xxx
