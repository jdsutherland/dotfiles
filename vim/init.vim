call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/keys.vim

lua require("lualine").setup()

hi! Conceal guifg=LightRed
hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#bababa

hi SpellRare cterm=undercurl guifg=Black guibg=LightRed
hi SpellBad cterm=undercurl guifg=Black guibg=#cc6666
