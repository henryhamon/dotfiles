#!/bin/sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew..."
brew update # Update homebrew recipes
brew tap homebrew/bundle

echo "Installing Essencial Command Line Tools and Apps..."

brew bundle
brew cleanup