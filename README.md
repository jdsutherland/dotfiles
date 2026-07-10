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

### Runtime tooling

[mise][] manages language runtimes and reads the existing `tool-versions` file.
[uv][] handles Python environments and dependencies; use `uv venv`, `uv add`,
and commit the resulting `uv.lock` in Python projects.

After updating Homebrew packages, open a new shell so mise activation takes effect.

[mise]:https://mise.jdx.dev/
[uv]:https://docs.astral.sh/uv/
[rcm]:https://github.com/thoughtbot/rcm
[slate]:https://github.com/mattr-/slate
[Karabiner-Elements]:https://github.com/pqrs-org/Karabiner-Elements

### Inspiration

- [christoomey](https://github.com/christoomey/dotfiles)
- [gabebw](https://github.com/gabebw/dotfiles)
