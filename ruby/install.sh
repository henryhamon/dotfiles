#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if [ "$(uname -s)" == "Darwin" ]; then
  bash_local="$DOTFILES_ROOT/locals/bash_local.symlink"

  echo "Installing rvm ..."
  brew install gpg
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable

  echo "export PATH=\"$PATH:$HOME/.rvm/bin\"" >> $bash_local
  echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $bash_local
fi
