#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sh symlink_dotfiles.sh

if [ "$(uname -s)" == "Darwin" ]; then
  sh brew.sh
  sh fonts.sh
fi

echo "Running custom install scripts"
find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' -not -path '*.git*' |
  while read -r src; do
    echo $src
    sh "$src"
  done

if [ "$(uname -s)" == "Darwin" ]; then
  sh set_osx_defaults.sh
fi
