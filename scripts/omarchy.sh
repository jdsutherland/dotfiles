#!/usr/bin/env bash
set -euo pipefail

# Bootstrap these dotfiles on a fresh Omarchy (Arch + Hyprland) machine.
# Idempotent — safe to re-run. See README.md for details.
#
# Omarchy itself is assumed to already be installed — this only layers our
# customizations on top of it:
#
#   1. rcm            (provides rcup; AUR, since Omarchy doesn't ship it)
#   2. omarchy.packages (extra official-repo packages, see that file)
#   3. keyd            (system-wide key remapping; official 'extra' repo)
#   4. Maple Mono NF   (AUR font, matches the mac machine)
#   5. Google Chrome   (default browser; see keyd/app.conf + ghostty config)
#   6. voxtype         (AI dictation)
#   7. rcup            (symlink the dotfiles)
#   8. mise install    (language runtimes from ~/.config/mise/config.toml)
#   9. Destructive Command Guard (agent safety)

DOTFILES="$HOME/.dotfiles"

info() { printf '\n\033[0;34m==> %s\033[0m\n' "$*"; }

if ! command -v yay >/dev/null 2>&1; then
  echo "yay not found — this script assumes Omarchy's default install (which ships yay)." >&2
  exit 1
fi

# 1. rcm (provides rcup)
if ! command -v rcup >/dev/null 2>&1; then
  info "Installing rcm (rcup)"
  yay -S --needed --noconfirm rcm
fi

# Bootstrap ~/.rcrc by hand: rcup's own rcm.sh library reads $HOME/.rcrc
# before it can process the dotfiles tree at all, so this has to exist
# before the first `rcup` call below — rcup can't symlink its own config in.
if [[ ! -e "$HOME/.rcrc" ]]; then
  info "Bootstrapping ~/.rcrc"
  ln -s "$DOTFILES/rcrc" "$HOME/.rcrc"
fi

# 2. Extra official-repo packages this setup depends on beyond Omarchy's
# own defaults (see omarchy.packages for what and why).
info "Installing extra packages"
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#|^\s*$' "$DOTFILES/omarchy.packages")

# 3. keyd — system-wide key remapping daemon
if ! command -v keyd >/dev/null 2>&1; then
  info "Installing keyd"
  sudo pacman -S --needed --noconfirm keyd
fi
# /etc is root-owned and can't be rcm-managed directly, so symlink by hand.
if [[ ! -e /etc/keyd/default.conf ]]; then
  info "Symlinking /etc/keyd/default.conf"
  sudo ln -sf "$DOTFILES/keyd/default.conf" /etc/keyd/default.conf
fi
sudo systemctl enable --now keyd
# keyd-application-mapper is bundled with keyd and autostarted by Hyprland
# (config/hypr/autostart.lua), not started here.

# 4. Maple Mono NF font
if ! fc-list | grep -qi "Maple Mono NF"; then
  info "Installing Maple Mono NF"
  omarchy-pkg-aur-add maplemono-nf
  omarchy-font-set 'Maple Mono NF'
fi

# 5. Google Chrome, set as default browser + terminal
if ! command -v google-chrome-stable >/dev/null 2>&1; then
  info "Installing Google Chrome"
  omarchy install browser chrome
fi
omarchy default browser chrome
omarchy default terminal ghostty

# 6. voxtype (AI dictation) — interactive installer; run manually if this
# step is skipped in a non-interactive shell.
if ! command -v voxtype >/dev/null 2>&1; then
  info "Installing voxtype"
  omarchy-voxtype-install
fi

# 7. Symlink dotfiles (rcup prompts before overwriting anything that exists)
info "Symlinking dotfiles (rcup)"
rcup -v

# 8. Language runtimes, from ~/.config/mise/config.toml (symlinked by rcup
# in step 7 — mise's true global config, so it applies everywhere; see
# README.md for why that matters vs. a bare .tool-versions file).
if command -v mise >/dev/null 2>&1; then
  info "Installing language runtimes (mise)"
  mise install
fi

# 9. Destructive Command Guard (agent safety) — same as scripts/install.sh
DCG_BIN="${DCG_BIN:-$HOME/.local/bin/dcg}"
if [[ ! -x "$DCG_BIN" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh?$(date +%s)" | bash -s -- --easy-mode
fi

info "Done. Open a new shell."
echo "Known gap: the internal PDM mic has no upstream ALSA UCM profile"
echo "(AMD ACP 7.0 / Strix Halo) — voxtype needs an external mic until"
echo "that's fixed upstream (alsa-ucm-conf issue #745)."
