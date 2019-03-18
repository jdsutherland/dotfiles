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

fzf-gittag-widget() {
  local result=$(fzf-gittag | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gittag-widget
bindkey '^x^t' fzf-gittag-widget

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

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^x^r' fzf-history-widget-accept

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

# ins_help() { BUFFER="$BUFFER--help"; CURSOR=$#BUFFER }; zle -N ins_help; bindkey "^A^H" ins_help

v(){
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview='bat --color=always {}'))
  [[ -n "$files" ]] && $VISUAL "${files[@]}"
}
# vim
vim-fzf-preview() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --preview-window=right:57% --multi --select-1 --exit-0 --preview 'bat --theme=TwoDark --color=always {}'))
  [[ -n "$files" ]] && ${EDITOR:-vim} -O "${files[@]}" && print -l "$files[@]"
}
bindkey -s '^p' ' vim-fzf-preview\n'

# ranger
ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
bindkey -s '^O' ' ranger-cd\n'
