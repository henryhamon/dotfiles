LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_CTYPE LC_ALL

# ALIASES

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# PATH

PATH=/usr/local/bin:$PATH # BREW
PATH=/usr/local/share/python:$PATH # Python via Brew

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_10.jdk/Contents/Home
GROOVY_HOME=/usr/local/Cellar/groovy/2.0.4/libexec
SCALA_HOME=/usr/local/Cellar/scala/2.9.2/libexec

PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

PATH=$PATH:$HOME/.rvm/bin # RVM
PATH=$HOME/.bin:$PATH # ~/.bin
PATH=$PATH:"/usr/local/share/npm/bin"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PATH PYTHONPATH JAVA_HOME GROOVY_HOME SCALA_HOME

EDITOR=vim
FIGNORE="~:.pyc:.swp:.swa:.git" # things to ignore during tab completion

export EDITOR FIGNORE

# TAB COMPLETITION

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# PROMPT COLORS (after installing GNU coreutils)

BOLD="\[\033[1m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\033[0m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"

# GIT PROMPT

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWSTASHSTATE
export GIT_PS1_SHOWUNTRACKEDFILES GIT_PS1_SHOWUPSTREAM

PROMPT_GIT='$(__git_ps1 "'${BLUE}' (%s)'${RESET}'")'
PS1="${BLUE}\u${WHITE}@${BLUE}\h ${WHITE}\W${PROMPT_GIT}${RESET}\$ "

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

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/alfakini/.gvm/bin/gvm-init.sh" && ! $(which gvm-init.sh) ]] && source "/Users/alfakini/.gvm/bin/gvm-init.sh"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
