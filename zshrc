# {{{ zinit
source /usr/local/opt/zinit/zinit.zsh

zinit ice pick"async.zsh" src"pure.zsh"
zinit light "sindresorhus/pure"

zinit light "Aloxaf/fzf-tab"
zinit wait lucid light-mode for \
    "hlissner/zsh-autopair" \
    "ael-code/zsh-colored-man-pages" \
    "wfxr/forgit" \
    "skywind3000/z.lua" \
    atinit"zicompinit; zicdreplay" \
        "zdharma/fast-syntax-highlighting" \
    atload"_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions" \
    blockf atpull'zinit creinstall -q .' \
        "zsh-users/zsh-completions"

zinit light softmoth/zsh-vim-mode
zinit snippet PZT::modules/directory
zinit snippet PZT::modules/history
zinit snippet PZT::modules/docker/alias.zsh
zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#373b41"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6C6C6A"
# }}}

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

export LS_COLORS=$(vivid generate jellybeans)
export BAT_PAGER=less

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
