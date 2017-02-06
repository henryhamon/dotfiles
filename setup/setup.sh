#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

ln -sf "$DOTFILES_ROOT" "$HOME/.dotfiles"

set -e

echo ''

sh ./setup/symlink_dotfiles.sh

if [ "$(uname -s)" == "Darwin" ]; then
  sh ./setup/install_brew.sh
  sh ./setup/install_fonts.sh
  sh ./setup/install_apps.sh
fi

echo "Running custom install scripts"
find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*' |
  while read -r src; do
    echo $src
    sh "$src"
  done

if [ "$(uname -s)" == "Darwin" ]; then
  sh ./setup/set_osx_defaults.sh
fi
