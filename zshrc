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
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# autorun tmux
# _not_inside_tmux() { [[ -z "$TMUX" ]] }
# ensure_tmux_is_running() {
#   if _not_inside_tmux; then
#     tat
#   fi
# }
# ensure_tmux_is_running

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(rbenv init - --no-rehash)"

# Variables
export s8="/Volumes/seag8"
export xc="/Volumes/seag8/screencasts"
export xcp="/Volumes/seag8/pluralsight"

# truecolors
# export TERM=xterm-256color

 #zsh-navigation-tools
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

# private
source ~/.private/private.sh

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh
# /usr/local/bin/git-tip
export PATH="/usr/local/opt/curl/bin:$PATH"

autoload -U promptinit; promptinit
source /usr/local/share/zsh/site-functions/_aws
export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/include:$PATH"
