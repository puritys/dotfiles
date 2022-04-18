if [[ `uname` == 'Darwin' ]]; then
    brew install neovim
    python3 -m pip install --user --upgrade pynvim
    #pip3 install pynvim
else
    # yum -y install libtool
    wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim-linux64.tar.gz
    tar -zxvf nvim-linux64.tar.gz
    sudo cp -r nvim-linux64/share/nvim/ /usr/share/
    sudo cp -r nvim-linux64/bin/nvim /usr/bin/
    sudo chmod -R 755 /usr/share/nvim/
    sudo chmod 755 /usr/bin/nvim
    sudo ln -sf /usr/bin/nvim /usr/bin/vim
fi
