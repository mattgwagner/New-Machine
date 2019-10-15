# Install Homebrew via shell script

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R `whoami`:admin /usr/local/bin

sudo chown -R `whoami`:admin /usr/local/share

# Assumes the Brewfile is on the same path

brew bundle 

# Install Microsoft Remote Desktop via AppStore?

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
