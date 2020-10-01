call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/keys.vim

hi! Conceal guifg=LightRed
hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#bababa
