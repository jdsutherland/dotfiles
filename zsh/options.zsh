#################
#  ZSH options  #
#################
HISTFILE=~/.zsh_history
HISTSIZE=1000000000000000000
SAVEHIST=$HISTSIZE
setopt no_list_beep
setopt no_beep
# Append as you type (incrementally) instead of on shell exit
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt autocd
setopt autopushd
# Timestamp history entries
setopt extended_history

# command preceded by space won't be added to history
setopt histignorespace

unsetopt correctall
# Allow [ or ] wherever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

# https://github.com/gabebw/dotfiles/pull/15
unsetopt multios

# 10ms for key sequences
KEYTIMEOUT=1

# i - Vim's smart case
# j.5 - Center search results
# F - Quit if the content is <1 screen
# K - Quit on CTRL-C
# M - Longer prompt
# R - handle ASCII color escapes
# X - Don't send clear screen signal
export LESS="ij.5FKMRX"
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"

# Show grep results in white text on a red background
export GREP_COLOR='1;37;41'

# fzf options
source ~/.dotfiles/zsh/fzf-config.zsh

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef
