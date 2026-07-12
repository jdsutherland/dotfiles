# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Re-assert PATH order from zshenv: on macOS, /etc/zprofile's path_helper runs
# after zshenv in login shells and moves system dirs ahead of our prepends.
# typeset -U path (set in zshenv) collapses the duplicates.
path=("$HOME/.local/bin" "$HOME/.npm-packages/bin" /opt/homebrew/bin $path)

# Activate mise so runtimes are selected from .tool-versions or mise.toml.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi


# {{{ zinit
# Self-install zinit on a fresh machine so a new shell never errors on the
# source below (the install script does not need a separate zinit step).
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}Installing zinit (zdharma-continuum)…%f"
  command git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi
source ~/.zinit/bin/zinit.zsh

# Custom completion functions
fpath+=("$HOME/.zsh/completions")

# Add Homebrew site-functions to fpath (optional, for Homebrew completions)
# Hardcoded prefix avoids a `brew --prefix` subprocess fork on every shell start.
fpath+=("/opt/homebrew/share/zsh/site-functions")
# mise provides its own shell integration and completions through activation.

# Load Prezto's completion module with zinit
zinit ice wait lucid blockf
zinit snippet PZT::modules/completion

zinit ice pick"async.zsh" src"pure.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid light-mode for \
    "hlissner/zsh-autopair" \
    "ael-code/zsh-colored-man-pages" \
    "wfxr/forgit" \
    atinit"zicompinit; zicdreplay" \
        "zdharma-continuum/fast-syntax-highlighting" \
    atload"_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions"

# Load fzf-tab after completions are initialized
zinit light Aloxaf/fzf-tab

zinit light softmoth/zsh-vim-mode
# git objects as C-g C-<key> widgets (files/branches/tags/remotes/hashes/…).
# Load synchronously (not turbo) so the widgets exist before keybindings.zsh
# runs its C-g C-g hash override.
zinit light junegunn/fzf-git.sh
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
fzf_shell="/opt/homebrew/opt/fzf/shell"
[ -f "$fzf_shell/key-bindings.zsh" ] && source "$fzf_shell/key-bindings.zsh"
[ -f "$fzf_shell/completion.zsh" ] && source "$fzf_shell/completion.zsh"

# zoxide — smart directory navigation (replaces z.lua)
unalias zi 2>/dev/null
eval "$(zoxide init zsh)"

# TERM is set by Ghostty config and ~/.zshenv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.zshenv_private ] && source ~/.zshenv_private

# dcg: warn if hook was silently removed from Claude Code settings. Checks
# both settings.json and settings.local.json since Claude Code merges them
# and the hook may live in either (it's in settings.local.json here).
if command -v dcg &>/dev/null && command -v jq &>/dev/null; then
  _dcg_found=0
  for _dcg_f in "$HOME/.claude/settings.json" "$HOME/.claude/settings.local.json"; do
    [ -f "$_dcg_f" ] && jq -e '.hooks.PreToolUse[]? | select(.hooks[]?.command | test("dcg$"))' "$_dcg_f" &>/dev/null && _dcg_found=1
  done
  [ "$_dcg_found" -eq 0 ] && printf '\033[1;33m[dcg] Hook missing from ~/.claude/settings*.json — run: dcg install\033[0m\n'
  unset _dcg_found _dcg_f
fi
