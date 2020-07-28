call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/keys.vim

" TODO: decide conceal color
" hi! Conceal guifg=#f1fa8c
hi! Conceal guifg=LightRed

" TODO coc colors
hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#b294bb
