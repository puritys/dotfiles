# .bashrc : do not echo any thing
#echo "=== Load ~/.bashrc ==="

export DOCKER_ID_USER=$(whoami)
export PLATFORM=$(uname -s)
export SHELL=/bin/bash
export TERM=xterm-256color
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=zh_TW.UTF-8
PATH=$PATH:$HOME/bin:/usr/local/bin:/sbin:/usr/local/sbin:/usr/sbin:/usr/local/go/bin
export PATH

export NODE_PATH=/usr/local/lib/node_modules:/usr/lib/node_modules

# Get the aliases and functions
if [ -f ~/.bash_host ]; then
    . ~/.bash_host
fi

if [ "x$host" == "x" ];then
    host=`uname -n`
fi

if [ -f ~/.bash_common ]; then
    . ~/.bash_common
fi

if [ "$PLATFORM" == "Darwin" ]; then
    if [ -f ~/.alias_mac ]; then
        . ~/.alias_mac
    fi
else
    if [ -f ~/.alias ]; then
        . ~/.alias
    fi
fi


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


# disable control-s and control-q
stty -ixon


# ------------
# source bash-it
# ------------
# Path to the bash it configuration
export BASH_IT="/home/puritys/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Load Bash It
if [ -f "$BASH_IT/bash_it.sh" ] && [ -z "$HAS_LOAD_BASH_IT" ]; then
    source "$BASH_IT"/bash_it.sh
    export HAS_LOAD_BASH_IT=true
fi


#changePS
setTerm
PROMPT_COMMAND=changePS

LS_COLORS='no=00:fi=00:di=38;5;26:ln=36:pi=33:so=35:do=35:bd=33:cd=33:or=31:ex=32:*.cmd=32:*.exe=32:*.com=32:*.bat=32:*.sh=32:*.csh=32:*.tar=31:*.tgz=1;31:*.taz=31:*.zip=1;30:*.gz=1;31:*.bz2=31:*.bz=31:*.tz=31:*.rpm=36:*.jpg=1;30:*.gif=1;30:*.bmp=1;30:*.png=1;30:*.jpeg=1;30:*.tif=35:*.h=1;35:*.jar=35:*.php=32:*.inc=32:*.sjs=32:*.js=32:*.sql=32:*.html=36:*.htm=36:*.xml=36'
LS_OPTIONS="-b --color=auto"
export LS_COLORS
export LS_OPTIONS
GREP_COLORS='mt=38;5;166:ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'
export GREP_COLORS

export FZF_DEFAULT_OPTS='
  --color light,hl:124,fg+:242,bg+:230,hl+:33
  --color info:52,prompt:245,spinner:245,pointer:245,marker:208
'
export _FASD_DATA=/tmp/.fasd
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -d ~/.sh_tool/clvv-fasd-4822024/ ] && eval "$(fasd --init auto)"

# ---------
# Load Customized settings
# ---------
if [ -f ~/.ssh/config_customized ]; then
    alias ssh='ssh -F <(cat .ssh/config ~/.ssh/config_customized)'
fi

if [ -f ~/.bash_customized ]; then
    . ~/.bash_customized
fi

if [ -f ~/.alias_customized ]; then
    . ~/.alias_customized
fi


