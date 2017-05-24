## Dotfiles

Targeted for osx 10.11. Managed with [rcm][1]. Install script is meant to be run a new osx machine.

### Uses
* [laptop][2] by thoughtbot
* zsh with [prezto][3]
* [slate][4]
* [karabiner][5]
* neovim
* tmux
* weechat
* [fzf][6]

### Install
```
git clone https://github.com/jdsutherland/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/install.sh
rcup -v
```

--------------------------------
Note, following saved in Dropbox:
* osx plists (with keyboard shortcuts)
* Alfred, Dash settings

[1]:https://github.com/thoughtbot/rcm
[2]:https://github.com/thoughtbot/laptop
[3]:https://github.com/sorin-ionescu/prezto/
[4]:https://github.com/mattr-/slate
[5]:https://github.com/tekezo/Karabiner
[6]:https://github.com/junegunn/fzf
