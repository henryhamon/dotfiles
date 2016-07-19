#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

sh ./scripts/symlink_dotfiles.sh

if [ "$(uname -s)" == "Darwin" ]; then
  sh ./scripts/install_brew.sh
  sh ./scripts/install_fonts.sh
  sh ./scripts/install_apps.sh

  ln -sf "$DOTFILES_ROOT/locals/bash_local" "$HOME/.bash_local"

  sublime_origin="$DOTFILES_ROOT/sublime/"
  sublime_dst="$HOME/Library/Application Support/Sublime Text 3"
  ln -sf "$sublime_origin" "$sublime_dst"

  sh ./scripts/set_osx_defaults.sh
fi
