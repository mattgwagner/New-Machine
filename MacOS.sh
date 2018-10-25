# Install Homebrew via shell script

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R `whoami`:admin /usr/local/bin

sudo chown -R `whoami`:admin /usr/local/share

brew install node

brew tap homebrew/cask

brew cask install keepingyouawake

brew cask install google-chrome

brew cask install virtualbox

brew cask install vagrant

brew install packer

brew cask install resilio-sync

brew cask install microsoft-teams

brew cask install microsoft-office

brew cask install adobe-acrobat-reader

brew cask install visual-studio

brew cask install visual-studio-code

brew cask install github

brew cask install google-backup-and-sync

brew cask install hermes

brew cask install flux

# Install Microsoft Remote Desktop via AppStore?

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
