if [[ `uname` == 'Darwin' ]]; then
    #wget https://github.com/neovim/neovim/releases/download/v0.12.5/nvim-linux-arm64.tar.gz
    #tar -zxvf nvim-linux-arm64.tar.gz
    #sudo mkdir -p /opt/homebrew/Cellar/neovim/0.12.5/
    #sudo cp -r nvim-linux-arm64/* /opt/homebrew/Cellar/neovim/0.12.5/
    #sudo ln -sf /opt/homebrew/Cellar/neovim/0.12.5/bin/nvim  /usr/local/bin/vim
    #rm -rf nvim-osx64 nvim-linux-arm64.tar.gz
    brew install neovim
    sudo ln -sf /opt/homebrew/bin/nvim  /usr/local/bin/vim
    python3 -m pip install --user --upgrade pynvim
else
    # yum -y install libtool
    sudo rm -rf nvim-linux*
    wget https://github.com/neovim/neovim-releases/releases/download/v0.10.0/nvim-linux64.tar.gz
    tar -zxvf nvim-linux64.tar.gz
    sudo rm -f /usr/bin/nvim
    sudo cp -r nvim-linux64/share/nvim/ /usr/share/
    sudo cp -r nvim-linux64/bin/nvim /usr/bin/
    sudo chmod -R 755 /usr/share/nvim/
    sudo chmod 755 /usr/bin/nvim
    sudo ln -sf /usr/bin/nvim /usr/bin/vim

    # install required python module
    sh installPython.sh
    python3 -m pip install --user --upgrade pynvim
fi
