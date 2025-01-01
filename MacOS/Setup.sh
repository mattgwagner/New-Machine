# Install Homebrew via shell script

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to .zshrc -> eval $(/opt/homebrew/bin/brew shellenv)

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

brew tap "homebrew/bundle"

brew install "git"

brew install "flux"

brew install "google-backup-and-sync"

brew install "keepingyouawake"

brew install "rectangle"

brew install "powershell"