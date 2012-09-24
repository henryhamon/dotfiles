LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_CTYPE LC_ALL

# ALIASES

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# PLUGINS
source ~/.bash/ssh-instance.bash

# PATH

PATH=/usr/local/bin:$PATH # BREW
PATH=/usr/local/share/python:$PATH # Python via Brew
PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
PATH=$PATH:$HOME/.rvm/bin # RVM
PATH=$HOME/Development/julia:$PATH # Julia lang
PATH=$HOME/.bin:$PATH # ~/.bin

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PATH PYTHONPATH

EDITOR=vim
FIGNORE="~:.pyc:.swp:.swa:.git" # things to ignore during tab completion

export EDITOR FIGNORE

# TAB COMPLETITION

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-completion.bash
fi

# PROMPT COLORS (after installing GNU coreutils)

BOLD="\[\033[1m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\033[0m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWSTASHSTATE
export GIT_PS1_SHOWUNTRACKEDFILES GIT_PS1_SHOWUPSTREAM

__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

PROMPT_GIT='$(__git_ps1 "'${BLUE}' (%s)'${RESET}'")'
PS1="[${WHITE}\u@\h \W${PROMPT_GIT}]\$ "
PS2="${BOLD}..>${RESET} "

# TITLEBAR

TITLEBAR='\[\033]0;\h:\w (\j jobs) \007\]'
case "$TERM_PROGRAM" in
  "Apple_Terminal")PS1="$TITLEBAR$PS1"
esac
case "$TERM" in
  "xterm")PS1="$TITLEBAR$PS1"
esac

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi
