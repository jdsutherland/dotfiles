#!/usr/bin/env bash
set -euo pipefail

# Bootstrap these dotfiles on a fresh macOS machine.
# Idempotent — safe to re-run. See README.md for details.
#
#   1. Install Homebrew
#   2. brew bundle  (formulae, casks, taps from the Brewfile)
#   3. rcup         (symlink the dotfiles; rcm comes from the Brewfile)
#   4. mise install (language runtimes from ~/.config/mise/config.toml)
#   5. optionally apply macOS defaults (scripts/macos.sh)
#
# zinit is NOT installed here: zshrc self-installs it on first shell start.

DOTFILES="$HOME/.dotfiles"

info() { printf '\n\033[0;34m==> %s\033[0m\n' "$*"; }

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Put brew on PATH for the rest of this script (Apple Silicon prefix).
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Packages
info "Installing packages (brew bundle)"
brew bundle --file="$DOTFILES/Brewfile"

# 3. Symlink dotfiles (rcup prompts before overwriting anything that exists)
info "Symlinking dotfiles (rcup)"
rcup -v

# 4. Language runtimes, from ~/.config/mise/config.toml (symlinked by rcup in
# step 3). This is mise's true global config, so it applies regardless of the
# directory this script is invoked from (unlike a bare .tool-versions file,
# which mise only finds by walking up from the current directory).
if command -v mise >/dev/null 2>&1; then
  info "Installing language runtimes (mise)"
  mise install
fi

# 5. Destructive Command Guard (agent safety)
DCG_BIN="${DCG_BIN:-$HOME/.local/bin/dcg}"
if [[ ! -x "$DCG_BIN" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh?$(date +%s)" | bash -s -- --easy-mode
fi

# 6. macOS system defaults (optional)
read -r -p $'\nApply macOS defaults (scripts/macos.sh)? [y/N] ' reply
case "$reply" in
  [yY]) "$DOTFILES/scripts/macos.sh" ;;
esac

info "Done. Open a new shell — zinit self-installs its plugins on first run."
