join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

# GIT heart FZF
fzf-gitfile-widget() {
  local result=$(fzf-gitfile | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitfile-widget
bindkey '^y' fzf-gitfile-widget

fzf-gitbranch-widget() {
  local result=$(fzf-gitbranch | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitbranch-widget
bindkey '^b' fzf-gitbranch-widget

fzf-gitremote-widget() {
  local result=$(fzf-gitremote | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitremote-widget
bindkey '^e' fzf-gitremote-widget

fzf-githash-widget() {
  local result=$(fzf-githash | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-githash-widget
bindkey '^g' fzf-githash-widget

fzf-git-browser-widget() { fzf-git-browser; zle reset-prompt }
zle     -N   fzf-git-browser-widget
bindkey '^_' fzf-git-browser-widget
# end fzf git bindings

# Vim-style line editing
bindkey -v

bindkey "^N" insert-last-word
# bindkey "^R" history-incremental-search-backward
bindkey "^F" menu-complete

# additional mapping for alt-c cd
zle     -N   fzf-cd-widget
bindkey '^]' fzf-cd-widget

bindkey -s '^p' ' vim -O $(fzf-down-full -m --preview "(highlight -O ansi {} || cat {}) 2> /dev/null");^m'

zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

ins_help() { BUFFER="$BUFFER--help"; CURSOR=$#BUFFER }; zle -N ins_help; bindkey "^O" ins_help
