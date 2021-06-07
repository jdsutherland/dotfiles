## dotfiles

Assumes macOS.

### Featuring
* zsh
* neovim
* alacritty
* tmux
* [slate][] for window management
* [Karabiner-Elements][] for keyboard customization

### Install

    $ git clone https://github.com/jdsutherland/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/scripts/install.sh
    $ rcup -v

### Installation

    $ git clone git@github.com:jdsutherland/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ ./install.sh

It will install [rcm][] and use that to safely symlink the dotfiles, prompting you
if a file already exists (like if you already have `~/.zshrc`).

[rcm]:https://github.com/thoughtbot/rcm
[slate]:https://github.com/mattr-/slate
[Karabiner-Elements]:https://github.com/pqrs-org/Karabiner-Elements

### Inspiration

- [christoomey](https://github.com/christoomey/dotfiles)
- [gabebw](https://github.com/gabebw/dotfiles)
