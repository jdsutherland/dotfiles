# Base16 Tomorrow Night
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#161617'
local color01='#1b1b1d'
local color02='#2a2a2d'
local color03='#3e3e43'
local color04='#57575f'
local color05='#757581'
local color06='#9998a8'
local color07='#c1c0d4'
local color08='#EA83A5'
local color09='#de935f'
local color0A='#f5a191'
local color0B='#90B99F'
local color0C='#EA83A5'
local color0D='#DAFEB4'
local color0E='#b294bb'
local color0F='#a3685a'

_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}

# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file ~/.ignore'
# export FZF_DEFAULT_COMMAND='fd --type f --follow --exl'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:30:hidden --bind ';:toggle-preview'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(bat --color=always {} 2> /dev/null || cat {} || tree -a -C -I '{.git,node_modules}' {}) 2> /dev/null | head -200'"
# export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C -I '{.git,node_modules}' {} | head -200'"
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# export FZF_ALT_C_COMMAND="rg --hidden --files -g '!{.git,node_modules,vendor}/*'"
export FZF_ALT_C_COMMAND='fd --type d ---ignore-file ~/.ignore --hidden --follow --max-depth 3'
export FZF_CTRL_T_COMMAND='fd --ignore-file ~/.ignore --hidden --follow'

export FZF_DEFAULT_OPTS="
  --bind ctrl-t:toggle-all,ctrl-f:toggle+down,ctrl-o:select-all
  --reverse --ansi
  --toggle-sort=ctrl-s
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

# export FZF_DEFAULT_OPTS='--ansi --layout=reverse --preview "bat --theme="base16" --style=full --decorations=always --color always {}"'

}

_gen_fzf_default_opts
