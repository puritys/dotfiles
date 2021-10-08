if [[ `uname` == 'Darwin' ]]; then
    brew install neovim
    python3 -m pip install --user --upgrade pynvim
fi
