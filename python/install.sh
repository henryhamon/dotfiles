#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

pip install flake8 flake8-docstrings

if [ "$(uname -s)" == "Darwin" ]; then
  echo "Installing pyenv ..."
  brew install pyenv
  echo "if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi" >> ~/.bash_local

  echo "Installing pyenv-virtualenv ..."
  brew install pyenv-virtualenv
  echo "if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi" >> ~/.bash_local

  echo "Installing Python 3"
  pyenv install 3.5.2 && pyenv rehash && pyenv global 3.5.2

fi
