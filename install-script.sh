#!/bin/sh

# thoughtbots laptop (https://github.com/thoughtbot/laptop/blob/master/README.md)
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
less mac
sh mac 2>&1 | tee ~/laptop.log

# get prezto
git clone --recursive https://github.com/jdsutherland/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# iterm config
# set iterm config from: http://sts10.github.io/blog/2015/10/24/true-hex-colors-with-neovim-and-iterm2/
# get and set font: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Inconsolata/complete

# rcup depends on .rcrc being in home - this is a workaround
RCRC=rcrc rcup

# copy karabiner settings
ln -s karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
cp config/org.pqrs.Karabiner.plist ~/Library/Preferences/org.pqrs.Karabiner.plist
# karabiner set key repeat 120/40 ?

# osx keyboard shortcuts
cp config/.GlobalPreferences.plist ~/Library/Preferences/.GlobalPreferences.plist

echo "finished install-script"
