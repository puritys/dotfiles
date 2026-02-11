if [[ `uname` == 'Darwin' ]]; then
    wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-macos.tar.gz
    tar -zxvf nvim-macos.tar.gz
    sudo mkdir -p /opt/homebrew/Cellar/neovim/0.8.1/
    sudo cp -r nvim-osx64/* /opt/homebrew/Cellar/neovim/0.8.1/
    sudo ln -sf /opt/homebrew/Cellar/neovim/0.8.1/bin/nvim  /usr/local/bin/vim
    rm -rf nvim-osx64 nvim-macos.tar.gz
    #brew install neovim
    #python3 -m pip install --user --upgrade pynvim
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
