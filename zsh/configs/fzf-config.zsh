# Base16 Tomorrow Night
# Author: Chris Kempson (http://chriskempson.com)

_gen_fzf_default_opts() {

local color00='#1d1f21'
local color01='#282a2e'
local color02='#373b41'
local color03='#969896'
local color04='#b4b7b4'
local color05='#c5c8c6'
local color06='#e0e0e0'
local color07='#ffffff'
local color08='#cc6666'
local color09='#de935f'
local color0A='#f0c674'
local color0B='#b5bd68'
local color0C='#8abeb7'
local color0D='#81a2be'
local color0E='#b294bb'
local color0F='#a3685a'

_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}

# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

# export FZF_DEFAULT_COMMAND='rg --files --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file ~/.ignore'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:30:hidden --bind ';:toggle-preview'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(bat --color=always {} 2> /dev/null || cat {} || tree -a -C -I '{.git,node_modules}' {}) 2> /dev/null | head -200'"
# export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C -I '{.git,node_modules}' {} | head -200'"
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# export FZF_ALT_C_COMMAND="rg --hidden --files -g '!{.git,node_modules,vendor}/*'"
export FZF_ALT_C_COMMAND='fd --type d ---ignore-file ~/.ignore --hidden --follow'
export FZF_CTRL_T_COMMAND='fd --ignore-file ~/.ignore --hidden --follow'

export FZF_DEFAULT_OPTS="
  --bind ctrl-t:toggle-all,ctrl-f:toggle+down,ctrl-o:select-all
  --reverse --ansi
  --toggle-sort=ctrl-w
  --black
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

# export FZF_DEFAULT_OPTS='--ansi --layout=reverse --preview "bat --theme="base16" --style=full --decorations=always --color always {}"'

}

_gen_fzf_default_opts
