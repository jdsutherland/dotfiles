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
# set CMD_L to be OPT_L (can map meta keys in vim/tmux)
#   set 'do not remap modifiers for alt+tab' (breaks cmd tap for alt tab)
#   set fullscreen, font inc/dec, preference mappings for alt (now that cmd doesn't work)

# copy karabiner settings
ln -s ~/.dotfiles/karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml

copy_plists()
{
  for i in ~/.dotfiles/config/*plist; do cp "$i" ~/Library/Preferences/; done
}
copy_plists

# karabiner set key repeat 225/20

# rcup depends on .rcrc being in home - this is a workaround
RCRC=rcrc rcup

# neovim: req for deoplete
pip3 install --upgrade neovim

echo "Finished install-script"
