#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sh $DOTFILES_ROOT/symlink_dotfiles.sh

if [ "$(uname -s)" == "Darwin" ]; then
  sh $DOTFILES_ROOT/brew.sh
  sh $DOTFILES_ROOT/fonts.sh
fi

echo ""
echo "[INFO] Running custom install scripts"
find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*' |
  while read -r src; do
    echo ""
    echo "[INFO] Installing $src"
    sh "$src"
  done

if [ "$(uname -s)" == "Darwin" ]; then
  sh $DOTFILES_ROOT/set_osx_defaults.sh
fi
