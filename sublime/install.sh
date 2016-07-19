#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

sublime_origin="$DOTFILES_ROOT/sublime/"
sublime_dst="$HOME/Library/Application Support/Sublime Text 3"
ln -sf "$sublime_origin" "$sublime_dst"
