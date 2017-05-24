#!/bin/bash

set -euo pipefail

# install.sh - intended to be run on fresh install of osx 10.11 (not macOS)

# What it does:
# ------------------------------------------------------------------
# Prompts install of the following:
# ------------------------------------------------------------------
# *thoughtbot's laptop install script
# *zsh prezto
# *Software from various packages (homebrew, npm, pip, rubygems, go)
# *base16 shell colors
# *osx config script
# *neovim setup
# *copy plists (from Dropbox)
# *you to manually config licenses (alfred, dash, totalspaces2, ynab, pia vpn) ((via lastpass))

dotfiles_path="$HOME/.dotfiles"

# colors
white='\033[0;37m'
green='\033[0;32m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal
alias Reset="tput sgr0"

# Color-echo.
#   Argument $1 = message
#   Argument $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

print_action_notification() {
  echo
  cecho "Action: $*..." "$cyan"
  echo
}

# thoughtbots laptop (https://github.com/thoughtbot/laptop/blob/master/README.md)
_get_thoughtbot_laptop() {
  print_action_notification "thoughtbot laptop"

  curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
  less mac
  sh mac 2>&1 | tee ~/laptop.log
}

_get_prezto() {
  print_action_notification "prezto"
  git clone --recursive https://github.com/jdsutherland/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
}

_get_base16_shell_colors() {
  print_action_notification "base16 shell colors"
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

# TODO: not sure if plist will make render this unnecessary
# iterm config
# get and set font: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Inconsolata/complete
# set CMD_L to be OPT_L (can map meta keys in vim/tmux)

# TODO: not sure if plist will make render this unnecessary
# karabiner set key repeat 225/20

_setup_karabiner() {
  print_action_notification "symlinking karabiner"
  ln -s "$dotfiles_path/karabiner/private.xml" ~/Library/Application\ Support/Karabiner/private.xml
}

_setup_neovim() {
  print_action_notification "neovim setup"

  # req for deoplete
  pip3 install --upgrade neovim

  # vim-plug
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # symlink to neovim dir
  mkdir -p ~/.config/nvim
  for f in $dotfiles_path/vim/* ; do
    ln -sf "$f" "$HOME/.config/nvim/${f##*/}"
  done
}


# fix for: zsh compinit: insecure directories, run compaudit for list.
# http://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
_fix_zsh_compinit_error() {
  cd /usr/local/share/
  sudo chmod -R 755 zsh
  sudo chown -R root:staff zsh
  popd
}

_setup_gopath() {
  print_action_notification "setup gopath"
  mkdir -p ~/go
  export GOPATH=~/go
  export PATH=$PATH:$GOPATH/bin
}

main_prompt() {
  # # Ask for the administrator password upfront
  # sudo -v

  # # Keep-alive: update existing `sudo` time stamp until script has finished
  # while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  _setup_gopath

  echo
  cecho "===================================================" "$white"
  cecho " Install thoughbot's laptop script? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      _get_thoughtbot_laptop
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Install prezto (zsh framework)? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      _get_prezto
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Install base16 shell colors? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      _get_base16_shell_colors
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Install osx customization script? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      print_action_notification "osx config script"
      "$dotfiles_path/scripts/osx.sh"
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Install software packages (brew, npm, pip, gems, go)? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      print_action_notification "packages"
      "$dotfiles_path/packages/install_package_files.sh"
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Copy backed up plists (requires Dropbox to be synced first)? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      # https://apple.stackexchange.com/questions/111534/iterm2-doesnt-read-com-googlecode-iterm2-plist
      # from above, may need to kill iterm2 and
      # `killall  cfprefsd` first
      echo "Copying plists from Dropbox"
      rsync -avhW --no-compress --progress ~/Dropbox/Library-Preferences ~/Library/Preferences
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Are you getting zsh compinit error when starting a shell? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      echo "Attempting to fix zsh compinit error"
      _fix_zsh_compinit_error
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Setup neovim (vim-plug, symlinks)? (y/n)" "$blue"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    [yY])
      _setup_neovim
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Do you want to restore Alfred, Dash, and YNAB sync (via Dropbox)? (y/n)" "$green"
  cecho "===================================================" "$white"
  read -r response
  case $response in
    *)
      echo "You gotta open the apps and do it manually, b"
  esac

  echo
  cecho "===================================================" "$white"
  cecho " Reminder: you probably need to enter licenses for Dash, Alfred, YNAB, TotalSpaces2 (via lastpass)" "$magenta"
  cecho "===================================================" "$white"

  echo
  cecho "===================================================" "$white"
  cecho " Reminder: Alfred probably didn't save your snippets" "$magenta"
  cecho "===================================================" "$white"

  echo
  cecho "===================================================" "$white"
  cecho " Reminder: You might need to install weechat scripts (see weechat/README.md)" "$magenta"
  cecho "===================================================" "$white"

  _setup_karabiner

  echo
  echo "Finished"
}

main_prompt

exit 0
