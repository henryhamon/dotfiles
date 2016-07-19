#!/bin/sh

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update # Update homebrew recipes

# INSTALL ESSENTIAL TOOLS FIRST

echo "Installing Essencial Command Line Tools ..."

brew install git git-extras bash-git-prompt
brew install bash coreutils findutils binutils
brew install bash-completion
brew install autoconf automake apple-gcc42
brew install the_silver_searcher
brew install wget

brew cleanup
