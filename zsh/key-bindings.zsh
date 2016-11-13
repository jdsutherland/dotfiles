join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-fg$c-widget() LBUFFER+=\$(fg$c | join-lines)"
    eval "zle -N fzf-fg$c-widget"
    eval "bindkey '^g^$c' fzf-fg$c-widget"
  done
}
bind-git-helper f b t r h
unset -f bind-git-helper

# Vim-style line editing
bindkey -v

bindkey "^N" insert-last-word
bindkey "^R" history-incremental-search-backward
