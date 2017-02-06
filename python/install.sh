#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo -H pip install -r $DOTFILES_ROOT/requirements.pip
sudo -H pip3 install -r $DOTFILES_ROOT/requirements.pip
