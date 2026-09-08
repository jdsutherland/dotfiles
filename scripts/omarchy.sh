#!/usr/bin/env bash
set -euo pipefail

# Bootstrap these dotfiles on a fresh Omarchy (Arch + Hyprland) machine.
# Idempotent — safe to re-run. See README.md for details.
#
# Omarchy itself is assumed to already be installed — this only layers our
# customizations on top of it:
#
#   1. rcm              (provides rcup; AUR, since Omarchy doesn't ship it)
#   2. repo packages    (portable additions from omarchy.packages)
#   3. AUR packages     (portable additions from omarchy.aur.packages)
#   4. keyd              (system-wide key remapping; official 'extra' repo)
#   5. Maple Mono NF     (AUR font, matches the mac machine)
#   6. Google Chrome     (default browser; see keyd/app.conf + ghostty config)
#   7. voxtype           (AI dictation)
#   8. Vesktop           (Wayland-friendly Discord client; AUR)
#   9. Sioyek            (content-aware PDF reader; AUR)
#  10. rcup              (symlink the dotfiles)
#  11. mise install      (language runtimes from ~/.config/mise/config.toml)
#  12. bat cache         (register custom bat themes)
#  13. Destructive Command Guard (agent safety)

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

# Register the homepath clean filter, which rewrites this machine's absolute
# home directory back to $HOME on staging (see scripts/git-clean-homepath.sh
# and .gitattributes). Filter config lives in .git/config, which isn't
# version controlled, so it has to be set per clone.
info "Registering the homepath git filter"
git -C "$DOTFILES" config filter.homepath.clean "scripts/git-clean-homepath.sh"
git -C "$DOTFILES" config filter.homepath.smudge "cat"

# Bootstrap ~/.rcrc by hand: rcup's own rcm.sh library reads $HOME/.rcrc
# before it can process the dotfiles tree at all, so this has to exist
# before the first `rcup` call below — rcup can't symlink its own config in.
if [[ ! -e "$HOME/.rcrc" ]]; then
  info "Bootstrapping ~/.rcrc"
  ln -s "$DOTFILES/rcrc" "$HOME/.rcrc"
fi

# 2. Portable official-repository packages beyond Omarchy's defaults.
mapfile -t repo_packages < <(grep -vE '^\s*#|^\s*$' "$DOTFILES/omarchy.packages")
info "Installing extra repository packages"
sudo pacman -S --needed --noconfirm "${repo_packages[@]}"

# 3. Portable AUR packages that do not need their own setup step.
mapfile -t aur_packages < <(grep -vE '^\s*#|^\s*$' "$DOTFILES/omarchy.aur.packages")
info "Installing extra AUR packages"
omarchy pkg aur add "${aur_packages[@]}"

# 4. keyd — system-wide key remapping daemon
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

# The daemon socket is restricted to the keyd group. The global remaps above
# work without this, but keyd-application-mapper cannot apply app-specific
# overlays until the login session has picked up the supplementary group.
if ! id -nG "$(id -un)" | tr ' ' '\n' | grep -qx keyd; then
  info "Adding $(id -un) to the keyd group"
  sudo usermod -aG keyd "$(id -un)"
fi
# keyd-application-mapper is bundled with keyd and autostarted by Hyprland
# (config/hypr/autostart.lua), not started here.

# 5. Maple Mono NF font
if ! fc-list | grep -qi "Maple Mono NF"; then
  info "Installing Maple Mono NF"
  omarchy-pkg-aur-add maplemono-nf
  omarchy-font-set 'Maple Mono NF'
fi

# 6. Google Chrome, set as default browser + terminal
if ! command -v google-chrome-stable >/dev/null 2>&1; then
  info "Installing Google Chrome"
  omarchy install browser chrome
fi
omarchy default browser chrome
omarchy default terminal ghostty

# 7. voxtype (AI dictation) — interactive installer; run manually if this
# step is skipped in a non-interactive shell.
if ! command -v voxtype >/dev/null 2>&1; then
  info "Installing voxtype"
  omarchy-voxtype-install
fi

# 8. Vesktop — Wayland-friendly Discord desktop client with Vencord built in.
# Remove Omarchy's Chrome Discord webapp so there is only one launcher.
if ! command -v vesktop >/dev/null 2>&1; then
  info "Installing Vesktop"
  omarchy pkg aur add vesktop
fi
OMARCHY_REMOVE_NOTIFY=false omarchy webapp remove Discord

# 9. Sioyek — content-aware PDF fitting that ignores page margins. Development
# package is used because the stable 2.0.0 AppImage package is years behind.
if ! command -v sioyek >/dev/null 2>&1; then
  info "Installing Sioyek PDF reader"
  omarchy pkg aur add sioyek-dev
fi
xdg-mime default sioyek.desktop application/pdf

# 10. Symlink dotfiles (rcup prompts before overwriting anything that exists)
info "Symlinking dotfiles (rcup)"
rcup -v
update-desktop-database "$HOME/.local/share/applications"

# The unit files are now symlinked. Use the custom location-aware wlsunset
# service instead of Omarchy's fixed-temperature hyprsunset process.
info "Enabling location-aware night light"
systemctl --user disable --now hyprsunset.service 2>/dev/null || true
systemctl --user daemon-reload
systemctl --user enable --now hypr-nightlight.service hypr-nightlight-refresh.timer

# 11. Language runtimes, from ~/.config/mise/config.toml (symlinked by rcup
# in step 10 — mise's true global config, so it applies everywhere; see
# README.md for why that matters vs. a bare .tool-versions file).
if command -v mise >/dev/null 2>&1; then
  info "Installing language runtimes (mise)"
  mise install
fi

# 12. bat theme cache. bat only picks up ~/.config/bat/themes/*.tmTheme once
# this cache is built; until then the --theme name in config/bat/config
# doesn't resolve and bat silently falls back to its built-in default, which
# looks close enough to the real theme to be confusing. Must run after rcup,
# since the themes are symlinked in step 10.
if command -v bat >/dev/null 2>&1; then
  info "Building bat theme cache"
  bat cache --build
fi

# 13. Destructive Command Guard (agent safety) — same as scripts/install.sh
DCG_BIN="${DCG_BIN:-$HOME/.local/bin/dcg}"
if [[ ! -x "$DCG_BIN" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh?$(date +%s)" | bash -s -- --easy-mode
fi

info "Done. Reboot or log out completely so keyd group membership takes effect."
echo "Known gap: the internal PDM mic has no upstream ALSA UCM profile"
echo "(AMD ACP 7.0 / Strix Halo) — voxtype needs an external mic until"
echo "that's fixed upstream (alsa-ucm-conf issue #745)."
