#!/bin/sh

echo "Installing Essencial Apps ..."

brew install brew-cask-completion

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

apps=$(<"$DOTFILES_ROOT/locals/apps")

brew cask install --appdir="/Applications" ${apps[@]}
# brew cask alfred link # As of v2.6, Alfred now has first-class support for Casks out of the box!
