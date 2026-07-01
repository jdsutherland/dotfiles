# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# {{{ zinit
source ~/.zinit/bin/zinit.zsh

# Add Homebrew site-functions to fpath (optional, for Homebrew completions)
fpath+=("$(brew --prefix)/share/zsh/site-functions")
# asdf version manager (Node, Go, Ruby, Python, etc.)
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
fpath+=("$(brew --prefix asdf)/share/zsh/site-functions")

# Load Prezto's completion module with zinit
zinit ice wait lucid blockf
zinit snippet PZT::modules/completion

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
        "zsh-users/zsh-autosuggestions"

# Load fzf-tab after completions are initialized
zinit light Aloxaf/fzf-tab

zinit light softmoth/zsh-vim-mode
zinit snippet PZT::modules/directory
zinit snippet PZT::modules/history
zinit snippet PZT::modules/docker/alias.zsh
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

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

# TODO: completions not working
# . /opt/homebrew/share/zsh/site-functions/


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
  eza --long --git --sort=accessed --group-directories-first
}

unsetopt correctall
# Allow [ or ] wherever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

# https://github.com/gabebw/dotfiles/pull/15
unsetopt multios

KEYTIMEOUT=25

# fzf shell integration (completions + key bindings)
fzf_shell="$(brew --prefix fzf)/shell"
[ -f "$fzf_shell/key-bindings.zsh" ] && source "$fzf_shell/key-bindings.zsh"
[ -f "$fzf_shell/completion.zsh" ] && source "$fzf_shell/completion.zsh"

# TODO: remove once https://github.com/so-fancy/diff-so-fancy/pull/398 merged
export PATH="$HOME/.dotfiles/bin/diff-so-fancy:$PATH"
# TERM is set by Ghostty config and ~/.zshenv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.zshenv_private ] && source ~/.zshenv_private
