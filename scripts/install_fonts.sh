#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

link_file () {
  origin=$1
  dst=${2%/}

  if [ -e "$dst" ]; then
    if [ "$(readlink "$dst")" = "$origin" ]; then
      echo "Skipped $origin"
      return 0
    else
      sudo mv "$dst" "$dst.backup"
      echo "Moved $dst to $dst.backup"
    fi
  fi
  ln -sf "$origin" "$dst"
  echo "Linked $origin to $dst"
}

install_fonts () {
  info 'Installing Fonts'
  dst="$HOME/Library/Fonts/"
  link_file "$DOTFILES_ROOT/Fonts" "$dst"
}

install_fonts
