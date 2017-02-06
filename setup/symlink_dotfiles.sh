#!/bin/sh

# Some things taken from here
# https://github.com/caarlos0/dotfiles/blob/master/script/bootstrap

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

ln -sf "$DOTFILES_ROOT" "$HOME/.dotfiles"

set -e

echo ''

link_file () {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" = "$1" ]; then
      echo "Skipped $1"
      return 0
    else
      mv "$2" "$2.backup"
      echo "Moved $2 to $2.backup"
    fi
  fi
  ln -sf "$1" "$2"
  echo "Linked $1 to $2"
}

install_dotfiles () {
  echo 'Installing dotfiles'
  find -H "$HOME/.dotfiles" -maxdepth 2 -name '*.symlink' -not -path '*.git*' |
    while read -r src; do
      dst="$HOME/.$(basename "${src%.*}")"
      link_file "$src" "$dst"
    done
}

install_dotfiles
