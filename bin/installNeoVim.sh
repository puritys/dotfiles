if [[ `uname` == 'Darwin' ]]; then
    brew install neovim
    python3 -m pip install --user --upgrade pynvim
    #pip3 install pynvim
else
    # yum -y install libtool
    wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim-linux64.tar.gz
    tar -zxvf nvim-linux64.tar.gz
    cd nvim-linux64
    make CMAKE_BUILD_TYPE=Release
    make install
fi
