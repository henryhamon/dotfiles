# UTF-8
#export LANG=no_NO.UTF-8
#export LOCALE=UTF-8
#export LESSCHARSET='utf-8'

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;37m\]" #means no background and white lines
HI="\[\033[0;34m\]" #user change this for letter colors
HII="\[\033[0;34m\]" #host change this for letter colors
SI="\[\033[0;37m\]" #this is for the current directory
IN="\[\033[0m\]"
GREEN="\[\033[0;32m\]"

# BASH PROMPT
PS1="$HI\u$NM@$HII\h$NM:\w$SI \$(__git_ps1 '(git branch $GREEN%s$NM)')\n\$ "
TITLEBAR='\[\033]0;\h:\w (\j jobs) \007\]'

# Terminal sets TERM_PROGRAM so we can tell it apart from regular VT100
case "$TERM_PROGRAM" in
  "Apple_Terminal")PS1="$TITLEBAR$PS1"
esac
case "$TERM" in
  "xterm")PS1="$TITLEBAR$PS1"
esac

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# Bash Completition
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
. /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Shell command aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vim

# ~/.bin
export PATH=~/.bin:$PATH

# BREW
export PATH=/usr/local/bin:$PATH

# Python via Brew
export PATH=/usr/local/share/python:$PATH
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Julia
export PATH="/Users/alfakini/Development/julia:$PATH"
