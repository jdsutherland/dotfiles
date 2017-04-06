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

# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*"'
# export FZF_CTRL_R_OPTS="--preview-window  --sort right:30% --preview 'echo {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind '\:toggle-preview'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_DEFAULT_OPTS="
  --bind=J:down,K:up --reverse --ansi
  --height 40% --border
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
