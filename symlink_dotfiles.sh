#!/bin/sh

# Some things taken from here
# https://github.com/caarlos0/dotfiles/blob/master/script/bootstrap

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
if [ -d "$HOME/.dotfiles" ]; then
  echo "[INFO] Skipped, $HOME/.dotfiles already linked"
else
  echo "[INFO] Linking $DOTFILES_ROOT to $HOME/.dotfiles"
  ln -s "$DOTFILES_ROOT" "$HOME/.dotfiles"
fi

set -e

link_file () {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" = "$1" ]; then
      echo "[INFO] Skipped, $1 already linked"
      return 0
    else
      mv "$2" "$2.backup"
      echo "[INFO] Moved $2 to $2.backup"
    fi
  fi
  ln -sf "$1" "$2"
  echo "[INFO] Linked $1 to $2"
}

install_dotfiles () {
  echo "[INFO] Installing dotfiles"
  find -H "$HOME/.dotfiles" -maxdepth 2 -name '*.symlink' -not -path '*.git*' |
    while read -r src; do
      dst="$HOME/.$(basename "${src%.*}")"
      link_file "$src" "$dst"
    done
}

install_dotfiles
