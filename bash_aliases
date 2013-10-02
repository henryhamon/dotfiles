alias sublime="subl"

# Bundler
alias b="bundle"
alias be="bundle exec"
alias bake="bundle exec rake"

# Rubygems
alias gemi="gem install"

# Rails
alias migrate="bundle exec rake db:migrate"

# Shell
alias l="ls"
alias cd..="cd .."
alias ..="cd .."
alias mkdir="mkdir -p"
alias h=history
alias e="exit"
alias c="clear"
alias del="rm"

# Mac
if ["$(uname)" == "Darwin"]; then
  alias ls="gls --color"
  alias locate="mdfind"
fi

function chrome() {
  open $@ --args --allow-file-access-from-files
}
