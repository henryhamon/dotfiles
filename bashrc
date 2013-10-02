LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_CTYPE LC_ALL

# PROMPT COLORS (after installing GNU coreutils)
BOLD="\[\033[1m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\033[0m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"

# ALIASES
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# PATH
PATH=/usr/local/bin:$PATH # BREW PATH

# LANGS PATH
if [ "$(uname)" == "Darwin" ]; then
  JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
  GROOVY_HOME=/usr/local/Cellar/groovy/2.0.4/libexec
  SCALA_HOME=/usr/local/Cellar/scala/2.9.2/libexec
  PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
  PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
  export PYTHONPATH JAVA_HOME GROOVY_HOME SCALA_HOME
fi

PATH=$PATH:$HOME/.rvm/bin # RVM PATH
if [ "$(uname)" == "Darwin" ]; then
  PATH=$PATH:"/usr/local/share/npm/bin" # NPM NODEJS PATH
  PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" # POSTGRES.APP PATH
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # GNU CORE UTILS PATH
fi
PATH=$HOME/.bin:$PATH # MY ~/.bin PATH
export PATH

if [ "$(uname)" == "Darwin" ]; then
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # MAN PATH
fi
export ACKRC=".ackrc" # ACK PATH

EDITOR=subl
FIGNORE="~:.pyc:.swp:.swa:.git" # things to ignore during tab completion

export EDITOR FIGNORE

# TAB COMPLETITION
if [ "$(uname)" == "Darwin" ]; then
  if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
  fi
elif [ "$(uname -o)" == "GNU/Linux" ]; then
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
fi

# GIT PROMPT
if [ "$(uname)" == "Darwin" ]; then
  if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
  fi
elif [ "$(uname -o)" == "GNU/Linux" ]; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion/git
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion/git
  fi
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWSTASHSTATE
export GIT_PS1_SHOWUNTRACKEDFILES GIT_PS1_SHOWUPSTREAM

PROMPT_GIT='$(__git_ps1 "'${BLUE}' (%s)'${RESET}'")'
PS1="${BLUE}\u${WHITE}@${BLUE}\h ${WHITE}\W${PROMPT_GIT}${RESET}\$ "

# COLORS
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# RVM CONFIG
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# GVM CONFIG
[[ -s "$HOME/.gvm/bin/gvm-init.sh" && ! $(which gvm-init.sh) ]] && source "$HOME/.gvm/bin/gvm-init.sh"

# HEROKU CONFIG
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
