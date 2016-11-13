# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

BASE="$HOME/.zsh"

load_all_files_in() {
  if [ -d "$BASE/$1" ]; then
    for file in "$BASE/$1"/*.zsh; do
      source "$file"
    done
  fi
}

load_all_files_in ""
# set colorscheme
source $HOME/.colors/base16-tomorrow.dark.sh

# autorun tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }
ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}
ensure_tmux_is_running

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(rbenv init - --no-rehash)"
