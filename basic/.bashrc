# .bashrc

# User specific aliases and functions

# Source global definitions

if [ "x$host" == "x" ];then
    host=`uname -n`
fi

#PS1="\[\e[3;37;44m\][$host]@ \w \[\e[0m\]\e[37m\]$arrow\e[0m\n"

powerline () {
    host=$1
    arrow=`echo  "\xee\x82\xb0"`
    arrowLight=`echo  "\xee\x82\xb1"`

    PS1="\[\e[3;37;44m\][$host]@ \[\e[0m\]"
    path=`pwd`
    split=(${path//\// })
    powPath=""
    length=${#split[@]}
    for ((i=0; i<$length;i++))
    do
        powPath="$powPath\e[3;37;44m ${split[$i]} \e[0m"
        j=$((i+1))
        if [ "$j" == "$length" ];then
            powPath="$powPath\e[34m$arrow\e[0m"
        else
            powPath="$powPath\e[37;44m$arrowLight\e[0m"
        fi
    done
    PS1="$PS1$powPath\n"
}
powerline $host

    case $TERM in
        screen*)
            # This is the escape sequence ESC k \w ESC
            # Use current dir as the title
            SCREENTITLE='\[\ek\W\e\\\]'
            PS1="${SCREENTITLE}${PS1}"
            ;;
        *)
            ;;
        xterm*)
        TITLEBAR='\[\e]0;online@\h:\w\a\]'
        PS1="${TITLEBAR}${PS1}"
        ;;
        *)
        ;;

    esac

LS_COLORS='no=00:fi=00:di=2;34:ln=36:pi=33:so=35:do=35:bd=33:cd=33:or=31:ex=32:*.cmd=32:*.exe=32:*.com=32:*.btm=32:*.bat=32:*.sh=32:*.csh=32:*.tar=31:*.tgz=1;31:*.arj=31:*.taz=31:*.lzh=31:*.zip=1;30:*.z=31:*.Z=31:*.gz=1;31:*.bz2=31:*.bz=31:*.tz=31:*.rpm=36:*.cpio=31:*.jpg=1;30:*.gif=1;30:*.bmp=1;30:*.xbm=35:*.xpm=35:*.png=1;30:*.jpeg=1;30:*.tif=35:*.h=1;35:*.jar=35:*.php=32:*.inc=32:*.sjs=32:*.js=32:*.sql=32:*.html=36:*.htm=36:*.xml=36:*.yicf=36'
LS_OPTIONS="-b --color=auto"
export LS_COLORS
export LS_OPTIONS


