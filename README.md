# .alfakini dotfiles

Dotfiles for Bash, command-line and programming tools I use.

## Settings

* `COMPUTER_NAME`: Your computer name
* `Brewfile`: The list of command line tools and apps you would like to install using with `brew` and `cask`
* `locals/bash_local`: Secret stuff you don't want in your versioned dotfiles

## Installation

```bash
$ git clone git@github.com:alfakini/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./setup.sh
```


curl -fLo "Knack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf

curl -fLo "Knack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Knack%20Italic%20Nerd%20Font%20Complete.ttf

curl -fLo "Knack Bold Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Knack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf

curl -fLo "Knack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Knack%20Bold%20Nerd%20Font%20Complete.ttf

# REDIS

brew install redis
brew services start redis

# POSTGRES

brew install postgres
brew services start postgresql
createuser --superuser --createdb --createrole --pwprompt -h localhost -U alfakini postgres

# MONGODB

# brew install mongodb
# brew services start mongodb

wget https://fastdl.mongodb.org/osx/mongodb-osx-x86_64-2.6.12.tgz
tar xvzf mongodb-osx-x86_64-2.6.12.tgz
sudo mkdir -p /data/db
sudo ./mongodb-osx-x86_64-2.6.12/bin/mongod

brew install imagemagick
