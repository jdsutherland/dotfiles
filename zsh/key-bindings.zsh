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

fzf-git-reverse-widget() { fzf-git-reverse; zle reset-prompt }
zle     -N   fzf-git-reverse-widget
bindkey '^x^g' fzf-git-reverse-widget
# end fzf git bindings
#

fzf-play-widget() { playlists; zle reset-prompt }
zle     -N   fzf-play-widget
bindkey '^x^p' fzf-play-widget

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

# Copy the most recent command to the clipboard
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^x^y' pbcopy-last-command

# Fuzzy match against history, edit selected value
_uniqe_without_sort() { awk '!x[$0]++' }
_fuzzy_history() {
  zle -U "$(
    history | \
    tail -2000 | \
    sed 's/ *[0-9]* *//' | \
    _uniqe_without_sort | \
    fzf-tmux --tac --reverse --no-sort
  )"
}
zle -N fuzzy-history _fuzzy_history
bindkey '^x^r' fuzzy-history

tmux-man-for-current-word() {
  cmd=$(echo "$BUFFER" | rev | sed -E 's/^ +//' | cut -d ' ' -f 1 | rev)
  width=$(tmux display -p '#{pane_width}')
  height=$(tmux display -p '#{pane_height}')
  normalized_height=$( echo "$height * 2.2" | bc )

  if (( normalized_height > width )); then
    tmux split-window -v "man $cmd"
  else
    tmux split-window -h "man $cmd"
  fi
}
zle -N tmux-man-for-current-word
bindkey '^Q' tmux-man-for-current-word

bindkey '^O' ranger-cd

ins_help() { BUFFER="$BUFFER--help"; CURSOR=$#BUFFER }; zle -N ins_help; bindkey "^A^H" ins_help
