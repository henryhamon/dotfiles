#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if [ "$(uname -s)" == "Darwin" ]; then
  sublime_origin="$DOTFILES_ROOT/sublime/"
  sublime_dst="$HOME/Library/Application Support/Sublime Text 3"
  ln -sf "$sublime_origin" "$sublime_dst"

  echo "Linking Sublime Text command line"
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  echo "Setting Git to use Sublime Text as default editor"
  git config --global core.editor "subl -n -w"
fi
