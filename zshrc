source ~/.zplug/init.zsh

zplug 'sindresorhus/pure'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'mafredri/zsh-async'
zplug 'ael-code/zsh-colored-man-pages'
zplug "modules/directory", from:prezto # for d stack
zplug 'skywind3000/z.lua'
zplug 'wfxr/forgit' # TODO: consider aliases
# zplug "kiurchv/asdf.plugin.zsh", defer:2

zplug load

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running

export EDITOR="nvim"
alias e=$EDITOR
alias vim="nvim"
alias vi="nvim"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. /usr/local/etc/bash_completion.d

export PATH="$HOME/.bin:$PATH"
source /Users/j/.asdf/asdf.sh

# Show contents of directory after cd-ing into it
chpwd() {
  exa --long --git --sort=accessed --group-directories-first
}

r() {
  rg -S -p "$@" | less -RFX
}

unsetopt correctall
# Allow [ or ] wherever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

# https://github.com/gabebw/dotfiles/pull/15
unsetopt multios

KEYTIMEOUT=25

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
