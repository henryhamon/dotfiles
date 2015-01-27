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

# LANGS PATH
if [ "$(uname)" == "Darwin" ]; then
  JAVA_HOME=/Library/Java/Home/
  export JAVA_HOME
fi

PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin # GNU CORE UTILS PATH
PATH=$PATH:$HOME/.bin # MY ~/.bin PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH

if [ "$(uname)" == "Darwin" ]; then
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # MAN PATH
fi
export ACKRC=".ackrc" # ACK PATH

EDITOR=subl
FIGNORE="~:.pyc:.swp:.swa:.git" # things to ignore during tab completion

export EDITOR FIGNORE

# TAB COMPLETITION
. ~/.bin/git-completion.bash

# GIT PROMPT
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME="Custom"
  GIT_PROMPT_ONLY_IN_REPO=0
  GIT_PROMPT_START="${BLUE}\u${WHITE}@${BLUE}\h${WHITE} \W"
  GIT_PROMPT_END="${RESET}\n$ "
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
# source ~/.bin/git-prompt.sh
# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWSTASHSTATE=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWUPSTREAM="auto"
# export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWSTASHSTATE
# export GIT_PS1_SHOWUNTRACKEDFILES GIT_PS1_SHOWUPSTREAM
# PROMPT_GIT='$(__git_ps1 "'${BLUE}' (%s)'${RESET}'")'

# COLORS
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

eval "$(pyenv init -)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

