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

# fzf here so that c-r can override
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
zinit light larkery/zsh-histdb
zinit light softmoth/zsh-vim-mode
zinit snippet PZT::modules/directory
zinit snippet PZT::modules/history
zinit snippet PZT::modules/docker/alias.zsh

# zsh-users/zsh-autosuggestions {{{
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#373b41"
#    }}}
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

export PATH="$HOME/.bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

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

# TODO: remove once https://github.com/so-fancy/diff-so-fancy/pull/398 merged
export PATH="$HOME/.dotfiles/bin/diff-so-fancy:$PATH"
