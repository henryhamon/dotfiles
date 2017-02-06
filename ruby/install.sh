#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname -s)" == "Darwin" ]; then
  if test $(which rvm); then
    echo "[INFO] Skipped, RVM already intalled"
  else
    bash_local="$DOTFILES_ROOT/locals/bash_local.symlink"

    echo "[INFO] Installing RVM ..."
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable

    echo "export PATH=\"$PATH:$HOME/.rvm/bin\"" >> $bash_local
    echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $bash_local
  fi
fi
