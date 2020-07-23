fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
# completion: use cache if updated within 24h
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump
else
  # Without redirecting output, it prints a lot of lines like this:
  #   "^A\"-\"^C\" self-inser" undefined-key
  #   "^D\" list-choice" undefined-key
  #   "^E\"-\"^F\" self-inser" undefined-key
  compinit -C >/dev/null
fi

zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Automatically recognize and complete commands that have been installed since
# the last time the zshrc was sourced.
# https://wiki.voidlinux.eu/Zsh#Persistent_rehash
zstyle ':completion:*' rehash true

# When you paste a <Tab>, don't try to auto-complete
zstyle ':completion:*' insert-tab pending

# When doing `cd ../<TAB>`, don't offer the current directory as an option.
# For example, if you're in foo, then `cd ../f` won't show `cd ../foo` as an
# option.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Colorful lists of possible autocompletions for `ls`
# zstyle doesn't understand the BSD-style $LSCOLORS at all, so use Linux-style
# $LS_COLORS
zstyle ':completion:*:ls:*:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
