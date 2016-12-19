# .bash_profile
#echo "=== Load ~/.bash_profile ==="
#echo "TERM = $TERM"

# Get the aliases and functions
if [ -f ~/.bash_host ]; then
	. ~/.bash_host
fi



if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ `uname` == "Darwin" ]; then
    if [ -f ~/.alias_mac ]; then
        . ~/.alias_mac
    fi
else
    if [ -f ~/.alias ]; then
        . ~/.alias
    fi
fi

if [ -f ~/.ssh/config_customized ]; then
    alias ssh='ssh -F <(cat .ssh/config ~/.ssh/config_customized)'
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/bin:/sbin:/usr/local/sbin:/usr/sbin

export NODE_PATH=/usr/local/lib/node_modules:/usr/lib/node_modules


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
     ls ~/.ssh/ | grep 'rsa\|dsa' | grep -v pub | awk '{printf "/usr/bin/ssh-add ~/.ssh/%s\n",$1}' | sh
}

getMySSHAgent
#myname=`whoami`
#if [ -n "$SSH_AUTH_SOCK" ]; then
#    true
#else
#    source $HOME/.ssh/environment
#fi

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# enable control-s and control-q
stty -ixon

if [ -f ~/.bash_customized ]; then
	. ~/.bash_customized
fi

if [ -f ~/.alias_customized ]; then
    . ~/.alias_customized
fi

