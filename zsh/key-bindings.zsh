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
bindkey '^u' fzf-gitfile-widget

fzf-gitbranch-widget() {
  local result=$(fzf-gitbranch | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitbranch-widget
bindkey '^b' fzf-gitbranch-widget

fzf-gittag-widget() {
  local result=$(fzf-gittag | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gittag-widget
bindkey '^a' fzf-gittag-widget

fzf-gitremote-widget() {
  local result=$(fzf-gitremote | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitremote-widget
bindkey '^e' fzf-gitremote-widget

fzf-githash-widget() {
  local result=$(fzf-githash | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-githash-widget
bindkey '^i' fzf-githash-widget
# end fzf git bindings

# Vim-style line editing
bindkey -v

bindkey "^N" insert-last-word
# bindkey "^R" history-incremental-search-backward
bindkey "^F" menu-complete

# additional mapping for alt-c cd
zle     -N    fzf-cd-widget
bindkey '^[' fzf-cd-widget

# load vim file with ^P
bindkey -s "^P" ' vim $(fzf -m);^m'

zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

ins_help() { BUFFER="$BUFFER--help"; CURSOR=$#BUFFER }; zle -N ins_help; bindkey "^O" ins_help
