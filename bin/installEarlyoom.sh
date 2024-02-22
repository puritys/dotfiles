if [ "x" != "x`command -v dnf`" ]; then
    git clone https://github.com/rfjakob/earlyoom.git
    cd earlyoom
    make
    sudo make install
    sudo systemctl enable --now earlyoom
    cd ../
    rm -rf earlyoom
else
    echo "could not found dnf"
fi
