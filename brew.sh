#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check for Homebrew, Install if we don't have it
echo ""
if test $(which brew); then
  echo "[INFO] Skipped, Homebrew already installed"
else
  echo "[INFO] Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  xcode-select --install
  sudo xcodebuild -license accept
fi

brew tap homebrew/bundle

echo ""
echo "[INFO] Installing Essencial Command Line Tools and Apps..."

brew bundle --file=$DOTFILES_ROOT/Brewfile
brew cleanup
