# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# {{{ zinit
source ~/.zinit/bin/zinit.zsh

zinit ice pick"async.zsh" src"pure.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid light-mode for \
    "hlissner/zsh-autopair" \
    "ael-code/zsh-colored-man-pages" \
    "wfxr/forgit" \
    "skywind3000/z.lua" \
    atinit"zicompinit; zicdreplay" \
        "zdharma-continuum/fast-syntax-highlighting" \
    atload"_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions" \

zinit ice wait lucid blockf
zinit snippet PZT::modules/completion

# NOTE: Must be after PZT completion. https://github.com/Aloxaf/fzf-tab/issues/199
zinit light Aloxaf/fzf-tab

zinit light softmoth/zsh-vim-mode
zinit snippet PZT::modules/directory
zinit snippet PZT::modules/history
zinit snippet PZT::modules/docker/alias.zsh

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#373b41"
# }}}

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

export EDITOR="nvim"
alias e=$EDITOR
alias vim="nvim"
alias vi="nvim"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
# TODO: completions not working
# . /opt/homebrew/share/zsh/site-functions/
# . /opt/homebrew/etc/bash_completion.d

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

export LS_COLORS=$(vivid generate kanagawa-dragon)
export BAT_PAGER=less
# lazygit uses this to change config dir
export XDG_CONFIG_HOME="$HOME/.config"

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
export TERM="alacritty"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
