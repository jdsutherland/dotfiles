#!/bin/sh

echo "Start install-script"

# thoughtbots laptop (https://github.com/thoughtbot/laptop/blob/master/README.md)
init_thoughtbot_laptop()
{
  curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
  less mac
  sh mac 2>&1 | tee ~/laptop.log
}
init_thoughtbot_laptop

# get prezto
install_prezto()
{
  git clone --recursive https://github.com/jdsutherland/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}
install_prezto

# iterm config
# set iterm config from: http://sts10.github.io/blog/2015/10/24/true-hex-colors-with-neovim-and-iterm2/
# get and set font: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Inconsolata/complete

# copy karabiner settings
ln -s karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml

copy_plists()
{
  for i in config/*plist; do cp "$i" ~/Library/Preferences/; done
}
copy_plists

# karabiner set key repeat 120/40 ?

# rcup depends on .rcrc being in home - this is a workaround
RCRC=rcrc rcup

echo "Finished install-script"
