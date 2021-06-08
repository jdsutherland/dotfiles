source ~/.zplug/init.zsh

zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'ael-code/zsh-colored-man-pages'
zplug "modules/directory", from:prezto # for d stack
zplug 'skywind3000/z.lua' # TODO: replace with zoxide and remove?
zplug 'wfxr/forgit' # TODO: consider aliases
zplug 'softmoth/zsh-vim-mode'

zplug load

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

export EDITOR="nvim"
alias e=$EDITOR
alias vim="nvim"
alias vi="nvim"

. /usr/local/opt/asdf/asdf.sh
. /usr/local/etc/bash_completion.d

# TODO: needed? these are slow
# export PATH="$(yarn global bin):$PATH"
# export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export PATH="$HOME/.bin:$PATH"

# Show contents of directory after cd-ing into it
chpwd() {
  exa --long --git --sort=accessed --group-directories-first
}

unsetopt correctall
# Allow [ or ] wherever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

# https://github.com/gabebw/dotfiles/pull/15
unsetopt multios

KEYTIMEOUT=25

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO: remove once https://github.com/so-fancy/diff-so-fancy/pull/398 merged
export PATH="$HOME/.dotfiles/bin/diff-so-fancy:$PATH"
