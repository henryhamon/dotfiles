#!/bin/sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

sh ./scripts/symlink_dotfiles.sh

if [ "$(uname -s)" == "Darwin" ]; then
  sh ./scripts/set_osx_defaults.sh
  sh ./scripts/install_brew.sh
  sh ./scripts/install_fonts.sh
  sh ./scripts/install_apps.sh
fi

echo "Running custom install scripts"
find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*' |
  while read -r src; do
    echo $src
    sh "$src"
  done
