## dotfiles

Supports macOS (Apple Silicon) and [Omarchy][] (Arch + Hyprland) — one repo,
with [rcm][]'s tag mechanism picking the right files per machine. See
[KEYBINDINGS.md](KEYBINDINGS.md) for the full keyboard setup on both.

### Featuring

* zsh (managed with [zinit][], prompt via [powerlevel10k][])
* neovim
* [Ghostty][] terminal
* tmux
* window management + app launching: [slate][] + [Hammerspoon][] (macOS) /
  Hyprland + [keyd][] (Omarchy)
* keyboard customization: [Karabiner-Elements][] (macOS) / keyd (Omarchy)

### Install

#### macOS

Prerequisite: the Xcode Command Line Tools (`xcode-select --install`) so `git`
is available.

    $ git clone https://github.com/jdsutherland/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/scripts/install.sh

`scripts/install.sh` is idempotent and:

1. installs Homebrew (if missing),
2. runs `brew bundle` to install formulae, casks, and taps from the `Brewfile`,
3. runs `rcup` ([rcm][]) to symlink the dotfiles, prompting before overwriting
   anything that already exists (e.g. an existing `~/.zshrc`),
4. runs `mise install` for language runtimes from `config/mise/config.toml`,
5. optionally applies macOS defaults (`scripts/macos.sh`).

zinit installs itself on the first new shell, so it is not a separate step.

#### Omarchy

Prerequisite: an installed [Omarchy][] system (this only layers dotfiles on
top of it — see `scripts/omarchy.sh` for exactly what it assumes already
exists).

    $ git clone https://github.com/jdsutherland/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/scripts/omarchy.sh

`scripts/omarchy.sh` is idempotent and:

1. installs [rcm][] (AUR, via `yay`, since Omarchy doesn't ship it),
2. installs the extra packages this repo depends on beyond Omarchy's own
   defaults (`omarchy.packages`),
3. installs keyd and symlinks `keyd/default.conf` to `/etc/keyd/default.conf`
   (`/etc` is root-owned, so rcm can't manage it directly),
4. installs Maple Mono NF (AUR font, matches the mac machine) and sets it
   system-wide,
5. installs Google Chrome and sets it as the default browser + Ghostty as
   the default terminal,
6. installs voxtype (AI dictation),
7. runs `rcup` to symlink the dotfiles,
8. runs `mise install` for language runtimes from `config/mise/config.toml`,
9. installs Destructive Command Guard (agent safety).

Known gap: the internal PDM mic has no upstream ALSA UCM profile (AMD ACP
7.0 / Strix Halo) — voxtype needs an external mic until that's fixed
upstream (`alsa-ucm-conf` issue #745).

### Runtime tooling

[mise][] manages language runtimes via `~/.config/mise/config.toml` — mise's
true global config, so runtimes are available in every directory (a bare
`.tool-versions` file only applies where mise finds it by walking up from the
current directory, e.g. it silently no-ops outside `$HOME`).
[uv][] handles Python environments and dependencies; use `uv venv`, `uv add`,
and commit the resulting `uv.lock` in Python projects.

After updating packages (Homebrew or pacman/AUR), open a new shell so mise
activation takes effect.

### Maintenance

Regenerate the `Brewfile` (macOS) from the current install with:

    $ brew bundle dump --force --describe --file=~/.dotfiles/Brewfile

`omarchy.packages` (Omarchy) is hand-curated rather than auto-regenerated —
it's a deliberate subset of `pacman -Qqe`, diffed against Omarchy's own
`/usr/share/omarchy/install/omarchy-{base,other}.packages` and filtered down
to what this repo actually depends on. Re-diff and re-curate by hand when
adding a new dependency; don't dump the raw diff in, since most of it is
either personal app installs or tools already covered by mise.

[zinit]:https://github.com/zdharma-continuum/zinit
[powerlevel10k]:https://github.com/romkatv/powerlevel10k
[Ghostty]:https://ghostty.org/
[mise]:https://mise.jdx.dev/
[uv]:https://docs.astral.sh/uv/
[rcm]:https://github.com/thoughtbot/rcm
[slate]:https://github.com/mattr-/slate
[Hammerspoon]:https://www.hammerspoon.org/
[Karabiner-Elements]:https://github.com/pqrs-org/Karabiner-Elements
[Omarchy]:https://omarchy.org/
[keyd]:https://github.com/rvaiya/keyd

### Inspiration

- [christoomey](https://github.com/christoomey/dotfiles)
- [gabebw](https://github.com/gabebw/dotfiles)
