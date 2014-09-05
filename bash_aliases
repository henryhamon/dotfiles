alias sublime="subl"

# Bundler
alias b="bundle"
alias be="bundle exec"
alias bake="be rake"
alias best="be ruby -I test/"

# Rubygems
alias gemi="gem install"

# Rails
alias migrate="bundle exec rake db:migrate"

#Postgres
alias pgstart="pg_ctl start -l /usr/local/var/postgres.log -D /usr/local/var/postgres"
alias pgstop="pg_ctl stop -D /usr/local/var/postgres"

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
if [ "$(uname)" == "Darwin" ]; then
  alias ls="gls --color"
  alias locate="mdfind"
fi

function chrome() {
  open $@ --args --allow-file-access-from-files
}
