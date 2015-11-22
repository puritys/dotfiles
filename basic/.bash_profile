# .bash_profile

# Get the aliases and functions
if [ -f ~/.bash_host ]; then
	. ~/.bash_host
fi


if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.alias ]; then
    . ~/.alias
fi


# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/bin:/sbin:/usr/local/sbin:/usr/sbin

export NODE_PATH=/usr/local/lib/node_modules


LANG=zh_TW.UTF-8
LC_TIME=C
export LANG
export PATH

SSH_ENV="$HOME/.ssh/environment"
function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add ~/.ssh/*_rsa.*;
}

myname=`whoami`
if [ -n "$SSH_AUTH_SOCK" ]; then
    true
else
    port=`ps aux | grep $myname | grep ssh-agent | grep -v grep | awk '{print $2}'`
    port=( $port )
    port=${port[0]}
    if [ ${#port} -gt 0 ];then
        port=$(($port - 2))
    else
        port=""
    fi

    if [ "x$port" != "x" ]; then
        file=`find /tmp/ssh* | grep $port |grep agent`
        SSH_AUTH_SOCK=$file
        export SSH_AUTH_SOCK

    fi
fi
export LANG=en_US.UTF-8

# enable control-s and control-q
stty -ixon
