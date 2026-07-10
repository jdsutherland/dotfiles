# i - Vim's smart case
# j.5 - Center search results
# F - Quit if the content is <1 screen
# K - Quit on CTRL-C
# M - Longer prompt
# R - handle ASCII color escapes
# X - Don't send clear screen signal
export LESS="ij.5KMRX"

# Keep user-installed tools ahead of Homebrew and system binaries.
typeset -U path
path=(
  "$HOME/.local/bin"
  "$HOME/.npm-packages/bin"
  /opt/homebrew/bin
  $path
)
export PATH
