#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname -s)" == "Darwin" ]; then
  if test $(which rvm); then
    echo "[INFO] Skipped, Sublime Text already intalled"
  else
    sublime_origin="$DOTFILES_ROOT/sublime/"
    sublime_dst="$HOME/Library/Application Support/Sublime Text 3"
    ln -sf "$sublime_origin" "$sublime_dst"

    echo "[INFO] Linking Sublime Text command line"
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
    echo "[INFO] Setting Git to use Sublime Text as default editor"
    git config --global core.editor "subl -n -w"
  fi
fi
