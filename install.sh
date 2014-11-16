# By lapwinglabs: http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update # Update homebrew recipes
brew install coreutils # Install GNU core utilities (those that come with OS X are outdated)
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install binutils
brew install bash # Install Bash 4

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing binaries..."
brew install trash
brew install ack the_silver_searcher
brew install wget
brew install git git-extras
brew install bash-completion
brew install libiconv
brew install autoconf automake apple-gcc42
brew install redis
brew install node
gem install rubocop
gem install awesome_print
gem install pry_doc
gem install pry_nav

brew cleanup

# CASK Apps
brew tap caskroom/homebrew-cask
brew install brew-cask

apps=(
  google-drive
  google-hangouts
  google-chrome
  firefox
  opera
  dropbox
  onepassword
  alfred
  caffeine
  appcleaner
  cleanmymac
  grandperspective
  the-unarchiver
  ynab
  spotify
  lastfm
  flux
  flash
  utorrent
  vlc
  subtitle-master
  skype
  sketch
  acorn
  dash
  screenflick
  slack
  iterm2
  sublime-text3
  github
  tower
  pgadmin3
  virtualbox
  vagrant
  mendeley-desktop
)

brew cask install --appdir="/Applications" vagrant

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
brew cask alfred link

sh ./osx-for-hackers.sh
