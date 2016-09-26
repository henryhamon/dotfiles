#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if [ "$(uname -s)" == "Darwin" ]; then
  echo "Installing pyenv ..."
  brew install pyenv
  echo "Installing Python 3"
  pyenv install 3.5.2 && pyenv rehash && pyenv global 3.5.2
fi
