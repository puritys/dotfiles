# =======================
# ECLIM
# =======================
# http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
if [ "x$updateEclim" == "x1" ]; then
    echo "If $HOME/.vim/eclipse is exists, skipping installing eclipse"
    if [[ `uname` == 'Darwin' ]]; then
        wgetPath=`which wget`
        if [ "x$wgetPath" == "x" ];then
            echo "You have to install wget"
            exit 1
        fi
        if [ ! -d $HOME/.vim/Eclipse.app ]; then
            #http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
            cd ~/ && wget http://mirror.rise.ph/eclipse/technology/epp/downloads/release/mars/2/eclipse-jee-mars-2-macosx-cocoa-x86_64.tar.gz
            if [ -d $HOME/.vim/eclipse ]; then rm -rf ~/.vim/eclipse; fi
            cd ~/ && tar -zxvf eclipse-jee-mars-2-macosx-cocoa-x86_64.tar.gz
            mv ~/Eclipse.app ~/.vim/
        fi

    else
        if [ ! -d $HOME/.vim/eclipse ]; then
            #http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2
            fileId="1VEd_hsvWHcAJvcfP8lEv4vNTSCRkPCpl"
            wget --save-cookies=/tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" --output-document /tmp/g
            #confirmId=`curl -c /tmp/cookie -s -L "https://drive.google.com/uc?export=download&id=${fileId}" | grep -o "confirm=[^&]*" | sed 's/confirm=//'`
            confirmId=`cat /tmp/g | grep -o "confirm=[^&]*" | sed 's/confirm=//'`
            cd ~/ && wget --load-cookies=/tmp/cookie --no-check-certificate "https://drive.google.com/uc?export=download&confirm=${confirmId}&id=1VEd_hsvWHcAJvcfP8lEv4vNTSCRkPCpl" --output-document eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
            if [ -d $HOME/.vim/eclipse ]; then rm -rf ~/.vim/eclipse; fi
            cd ~/ && tar -zxvf eclipse-jee-mars-2-linux-gtk-x86_64.tar.gz
            mv ~/eclipse ~/.vim/
        fi
    fi


    cd $pwd
    cp vim/javaPlugin/eclim_settings ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclim.prefs
fi

cd $pwd
if [ "x$installEclim" == "x1" ]; then
    #install Xvfb
    if [[ `uname` != 'Darwin' ]]; then
        sudo yum install xorg-x11-server-Xvfb gtk2 -y
    fi

    if [ -f "/usr/share/X11/xkb/symbols/inet" ]; then
        sudo sed 's/\/\/zz//' -i /usr/share/X11/xkb/symbols/inet
        sudo sed 's/key <FK20>.*XF86AudioMicMute/\/\/zzkey <FK20> {[XF86AudioMicMute/' -i /usr/share/X11/xkb/symbols/inet
    fi
    ps aux |grep -i Xvfb |grep -v grep | awk '{printf "kill -9 %s\n",$2}' | sudo sh
    export DISPLAY=:1

    if [[ `uname` != 'Darwin' ]]; then
        echo "\n\n=== Start Xvfb ===\n\n"
        sudo Xvfb :1 -screen 0 1024x768x24 &
    fi
    echo "\n\n=== Start eclipse ===\n\n"
    if [ `uname` == 'Darwin' ]; then
        open ~/.vim/Eclipse.app
        echo "\n\n=== Install eclim ===\n\n"
        java -Dvim.files=$HOME/.vim  -Declipse.home=$eclipseHome  -jar ./vim/javaPlugin/eclim_2.6.0.jar install

    else
        DISPLAY=:1 ~/.vim/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director   -repository http://download.eclipse.org/releases/juno      -installIU org.eclipse.wst.web_ui.feature.feature.group &
        sleep 5
        echo "\n\n=== Install eclim ===\n\n"
        java -Dvim.files=$HOME/.vim  -Declipse.home=$HOME/.vim/eclipse/  -jar ./vim/javaPlugin/eclim_2.6.0.jar install

    fi
    sleep 25


    #echo "\n\n=== Start eclimd ===\n\n"
    # log ~/workspace/.metadata/.log
    DISPLAY=:1 $eclipseHome/eclimd -b
    sleep 20


    # :ProjectCreate ./ -n java
    # :ProjectList
    # :ProjectDelete xxx
    # mvn dependency:resolve (update classpath)

    if [ ! -d ~/.eclim/ ];  then mkdir ~/.eclim/; fi
fi

