#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e

link_file () {
  origin=$1
  dst=${2%/}

  if [ -e "$dst" ]; then
    if [ "$(readlink "$dst")" = "$origin" ]; then
      echo "[INFO] Skipped, $origin already linked"
      return 0
    else
      sudo mv "$dst" "$dst.backup"
      echo "[INFO] Moved $dst to $dst.backup"
    fi
  fi
  ln -sf "$origin" "$dst"
  echo "[INFO] Linked $origin to $dst"
}

install_fonts () {
  echo ""
  echo "[INFO] Installing Fonts"
  dst="$HOME/Library/Fonts/"
  link_file "$HOME/.dotfiles/Fonts" "$dst"
}

install_fonts
