#!/bin/sh

SUBLIME_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname -s)" == "Darwin" ]; then
  if test $(which subl); then
    echo "[INFO] Skipped, Sublime Text already intalled"
  else
    echo "[INFO] Linking Sublime Text 3 configs"
    sublime_dst="$HOME/Library/Application Support/Sublime Text 3"
    ln -sf "$SUBLIME_ROOT" "$sublime_dst"
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  fi
fi
