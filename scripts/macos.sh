#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS defaults..."

# Keyboard
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 5
defaults write -g KeyRepeat -int 1

# Trackpad / mouse
defaults write -g com.apple.trackpad.scaling -float 2.5
defaults write -g com.apple.mouse.scaling -float 2.5

# Writing/code annoyances
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Screenshots
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true

# Finder basics
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Save / print dialogs expanded by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock show-recents -bool false

# Optional: show only running apps in Dock.
# Uncomment if you really want a minimal Dock.
# defaults write com.apple.dock static-only -bool true

# Mission Control / Spaces
defaults write com.apple.dock expose-animation-duration -float 0.15

#!/usr/bin/env bash

# Ctrl-h/l = back/forward
# Ctrl-j/k = prev/next tab
chromium_browsers=(
  "com.google.Chrome"
  "com.google.Chrome.beta"
  "com.brave.Browser"
  "com.brave.Browser.beta"
)

firefox_browsers=(
  "org.mozilla.firefox"
  "org.mozilla.firefoxdeveloperedition"
)

for app in "${chromium_browsers[@]}"; do
  defaults write "$app" NSUserKeyEquivalents -dict-add "Back" "^h"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Forward" "^l"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Select Previous Tab" "^j"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Select Next Tab" "^k"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Close Tab" "^d"
done

for app in "${firefox_browsers[@]}"; do
  defaults write "$app" NSUserKeyEquivalents -dict-add "Back" "^h"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Forward" "^l"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Previous Tab" "^j"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Next Tab" "^k"
  defaults write "$app" NSUserKeyEquivalents -dict-add "Close Tab" "^d"
done

killall cfprefsd 2>/dev/null || true

echo "Done. Fully quit and reopen browsers."

# Restart affected services/apps
killall cfprefsd 2>/dev/null || true
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "Done. Some settings may require logout/reboot."
