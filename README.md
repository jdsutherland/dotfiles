## dotfiles

Assumes macOS (Apple Silicon).

### Featuring

* zsh (managed with [zinit][], prompt via [powerlevel10k][])
* neovim
* [Ghostty][] terminal
* tmux
* [slate][] for window tiling + [Hammerspoon][] for app launching / automation
* [Karabiner-Elements][] for keyboard customization

### Install

Prerequisite: the Xcode Command Line Tools (`xcode-select --install`) so `git`
is available.

    $ git clone https://github.com/jdsutherland/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/scripts/install.sh

`scripts/install.sh` is idempotent and:

1. installs Homebrew (if missing),
2. runs `brew bundle` to install formulae, casks, and taps from the `Brewfile`,
3. runs `rcup` ([rcm][]) to symlink the dotfiles, prompting before overwriting
   anything that already exists (e.g. an existing `~/.zshrc`),
4. runs `mise install` for language runtimes from `tool-versions`,
5. optionally applies macOS defaults (`scripts/macos.sh`).

zinit installs itself on the first new shell, so it is not a separate step.

### Runtime tooling

[mise][] manages language runtimes and reads the existing `tool-versions` file.
[uv][] handles Python environments and dependencies; use `uv venv`, `uv add`,
and commit the resulting `uv.lock` in Python projects.

After updating Homebrew packages, open a new shell so mise activation takes effect.

### Maintenance

Regenerate the `Brewfile` from the current install with:

    $ brew bundle dump --force --describe --file=~/.dotfiles/Brewfile

[zinit]:https://github.com/zdharma-continuum/zinit
[powerlevel10k]:https://github.com/romkatv/powerlevel10k
[Ghostty]:https://ghostty.org/
[mise]:https://mise.jdx.dev/
[uv]:https://docs.astral.sh/uv/
[rcm]:https://github.com/thoughtbot/rcm
[slate]:https://github.com/mattr-/slate
[Hammerspoon]:https://www.hammerspoon.org/
[Karabiner-Elements]:https://github.com/pqrs-org/Karabiner-Elements

### Inspiration

- [christoomey](https://github.com/christoomey/dotfiles)
- [gabebw](https://github.com/gabebw/dotfiles)
