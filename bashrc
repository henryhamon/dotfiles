# ALIASES
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# PROMPT COLORS (after installing GNU coreutils)
BOLD="\[\033[1m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\033[0m\]"
WHITE="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"

# GIT PROMPT
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME="Custom"
  GIT_PROMPT_ONLY_IN_REPO=0
  GIT_PROMPT_START="${BLUE}\u${WHITE}@${BLUE}\h${WHITE} \W"
  GIT_PROMPT_END="${RESET}\n$ "
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# COLORS
if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='--color=auto'
fi

# CONFIGS
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # MAN PATH
export ACKRC=".ackrc" # ACK PATH
export EDITOR=subl
export FIGNORE="~:.pyc:.swp:.swa:.git" # things to ignore during tab completion

export LANG="UTF-8"
export LC_CTYPE="UTF-8"
export LC_ALL=en_US.UTF-8

# TAB COMPLETITION
. ~/.bin/git-completion.bash

PATH="$PATH:$HOME/.bin" # MY ~/.bin PATH
PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin" # GNU CORE UTILS PATH
export PATH

# LANGS PATH
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home"
export PATH="/Users/alfakini/Documents/Code/miniconda3/bin:$PATH" # added by Miniconda3 3.18.8 installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
