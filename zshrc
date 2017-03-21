# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

BASE="$HOME/.zsh"

load_all_files_in() {
  if [ -d "$BASE" ]; then
    for file in "$BASE"/*.zsh; do
      source "$file"
    done
  fi
}

load_all_files_in
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

# Variables
export xc="/Volumes/seag8/screencasts"
export xcp="/Volumes/seag8/screencasts/pluralsight"

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

eval $(thefuck --alias)
