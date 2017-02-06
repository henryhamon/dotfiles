#!/bin/sh

echo "Installing Essencial Apps ..."

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

apps=$(<"$DOTFILES_ROOT/locals/apps")

brew cask install --appdir="/Applications" ${apps[@]}
# brew cask alfred link # As of v2.6, Alfred now has first-class support for Casks out of the box!
