# {{{ vi mode
bindkey -v # set vi mode (must be first)
# open current command in vim (from normal mode)

# autoload -z edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd '^v' edit-command-line

bindkey -M vicmd "u" undo
bindkey -M vicmd '^r' redo
# }}}

# handy keybindings
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^d" backward-delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^n" insert-last-word
bindkey "^f" menu-complete
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Copy the most recent command to the clipboard
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy && \
    tmux display-message "Previous command coppied to clipboard"
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^x^y' pbcopy-last-command

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
bindkey '^b' tmux-man-for-current-word

vim-fzf-preview() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --preview-window=right:57% --multi --select-1 --exit-0 --preview 'bat --color=always {}'))
  [[ -n "$files" ]] && ${EDITOR:-vim} -O "${files[@]}" && print -l "$files[@]"
}
bindkey -s '^P' ' vim-fzf-preview\n'

ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /opt/homebrew/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
bindkey -s '^O' ' ranger-cd\n'

fzf-play-widget() { playlists; zle reset-prompt }
zle     -N   fzf-play-widget
bindkey '^x^p' fzf-play-widget

# {{{ git fzf
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

# Git branches
fzf-gitfile-widget() {
  local result=$(fzf-gitfile | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitfile-widget
bindkey '^g^f' fzf-gitfile-widget

fzf-gittag-widget() {
  local result=$(fzf-gittag | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gittag-widget
bindkey '^g^t' fzf-gittag-widget

fzf-gitbranch-widget() {
  local result=$(fzf-gitbranch | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitbranch-widget
bindkey '^g^b' fzf-gitbranch-widget

fzf-gitremote-widget() {
  local result=$(fzf-gitremote | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-gitremote-widget
bindkey '^g^r' fzf-gitremote-widget

fzf-githash-widget() {
  local result=$(fzf-githash | join-lines); zle reset-prompt; LBUFFER+=$result
}
zle     -N   fzf-githash-widget
bindkey '^g^g' fzf-githash-widget

fzf-git-browser-widget() { gfzf; zle reset-prompt }
zle     -N   fzf-git-browser-widget
bindkey '^_' fzf-git-browser-widget
# }}}
