#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

ln -sf "$DOTFILES_ROOT/locals/bash_local" "$HOME/.bash_local"
