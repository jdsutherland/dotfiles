# i - Vim's smart case
# j.5 - Center search results
# F - Quit if the content is <1 screen
# K - Quit on CTRL-C
# M - Longer prompt
# R - handle ASCII color escapes
# X - Don't send clear screen signal
export LESS="ij.5KMRX"

# Platform, used by zshrc and zsh/configs/*.zsh for per-OS branches.
export UNAME="$(uname -s)"

# Homebrew prefix; empty when Homebrew isn't installed on this platform.
case "$UNAME" in
  Darwin) HOMEBREW_PREFIX=/opt/homebrew ;;
  Linux)  HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew ;;
  *)      HOMEBREW_PREFIX= ;;
esac

# Keep user-installed tools ahead of Homebrew and system binaries.
typeset -U path
system_path=($path)
path=(
  "$HOME/.local/bin"
  "$HOME/.npm-packages/bin"
  "$HOME/.bin"
)
[[ -n "$HOMEBREW_PREFIX" && -d "$HOMEBREW_PREFIX/bin" ]] && path+=("$HOMEBREW_PREFIX/bin")
path+=($system_path)
export PATH
