" if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
" 	finish
" endif

" syntax keyword vimCommand function conceal cchar=ƒ
" syntax keyword vimCommand endfunction conceal cchar=}
" syntax match vimCommand "endfo\w*" conceal
" syntax match vimCommand "end[iw]\w*" conceal
" syntax keyword vimCommand return conceal cchar=⇚
" syntax match vimCommand "norm\(al\)\?" conceal cchar=ɴ

" syntax match vimOper "\.\.\." conceal cchar=…
" syntax keyword vimCommand in conceal cchar=∈
" syntax keyword vimCommand let conceal cchar=ℓ
" " syntax keyword vimCommand setlocal conceal cchar=𐊖
" syntax keyword vimMapModKey silent conceal cchar=♪
" " syntax match vimCommand " \zs\.\ze " conceal cchar=+
" " syntax match vimOper "\_\\\_" conceal

" syntax match vimOper "=\@<!===\@!" conceal cchar=≡
" syntax match vimOper "=\@<!==#=\@!" conceal cchar=≣
" syntax match vimOper "!==\@!" conceal cchar=≠
" syntax match vimOper "\s\+\zs!==\ze\s\+" conceal cchar=≢
" syntax match vimOper "\s\+\zs!==\ze\s\+" conceal cchar=≢
" syntax match vimOper "=\~" conceal cchar=≆
" syntax match vimOper "\s\zs<=\ze\s" conceal cchar=≤
" syntax match vimOper "\s\zs>=\ze\s" conceal cchar=≥

" " syntax match vimOper "&&" conceal cchar=∧
" " syntax match vimOper "||=\@!" conceal cchar=∨

" " hi! link vimNice Operator
" hi! link Conceal Operator
" hi! Conceal guifg=LightRed
