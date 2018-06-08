# Install Homebrew via shell script

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask

brew cask install google-chrome

brew cask install virtualbox

brew cask install vagrant

# brew cask install packer

brew cask install resilio-sync

brew cask install microsoft-teams

# brew cask install microsoft-office

brew cask install visual-studio-code

brew cask install google-backup-and-sync

brew cask install onedrive

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