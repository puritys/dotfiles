if [ "x" = "x`command -v wget`" ]; then
    if [ "x" != "x`command -v yum`" ]; then
        sudo yum install -y wget
    else
        brew install tmux
    fi
fi
