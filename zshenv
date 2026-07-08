# i - Vim's smart case
# j.5 - Center search results
# F - Quit if the content is <1 screen
# K - Quit on CTRL-C
# M - Longer prompt
# R - handle ASCII color escapes
# X - Don't send clear screen signal
export LESS="ij.5KMRX"

# Keep version-manager shims ahead of Homebrew for tools like node/npm.
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
typeset -U path
path=(
  "$ASDF_DATA_DIR/shims"
  "$HOME/.npm-packages/bin"
  /opt/homebrew/bin
  $path
)
export PATH
