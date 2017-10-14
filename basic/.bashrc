# .bashrc : do not echo any thing
#echo "=== Load ~/.bashrc ==="


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
source "$BASH_IT"/bash_it.sh


# User specific aliases and functions

# Source global definitions

if [ "x$host" == "x" ];then
    host=`uname -n`
fi

if [ -f ~/.bash_common ]; then
	. ~/.bash_common
fi
#echo "===  ~/.bashrc changePS ==="

changePS
PROMPT_COMMAND=changePS

LS_COLORS='no=00:fi=00:di=2;34:ln=36:pi=33:so=35:do=35:bd=33:cd=33:or=31:ex=32:*.cmd=32:*.exe=32:*.com=32:*.btm=32:*.bat=32:*.sh=32:*.csh=32:*.tar=31:*.tgz=1;31:*.arj=31:*.taz=31:*.lzh=31:*.zip=1;30:*.z=31:*.Z=31:*.gz=1;31:*.bz2=31:*.bz=31:*.tz=31:*.rpm=36:*.cpio=31:*.jpg=1;30:*.gif=1;30:*.bmp=1;30:*.xbm=35:*.xpm=35:*.png=1;30:*.jpeg=1;30:*.tif=35:*.h=1;35:*.jar=35:*.php=32:*.inc=32:*.sjs=32:*.js=32:*.sql=32:*.html=36:*.htm=36:*.xml=36:*.yicf=36'
LS_OPTIONS="-b --color=auto"
export LS_COLORS
export LS_OPTIONS


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fasd --init auto)"


