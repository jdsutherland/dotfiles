if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax keyword luaNice function conceal cchar=ƒ
syntax keyword luaNice local conceal cchar=ℓ
syntax keyword luaNice return conceal cchar=⇚
syntax keyword luaNice end conceal
syntax keyword luaNice nil conceal cchar=∅
syntax keyword luaNice true conceal cchar=✓
syntax keyword luaNice false conceal cchar=✗
syntax keyword luaNice self conceal cchar=@
syntax keyword luaNice not conceal cchar=¬
syntax keyword luaNice tostring conceal cchar=⟆
syntax keyword luaNice string conceal cchar=⟆
syntax keyword luaNice type conceal cchar=₪

syntax match luaNice "assert" conceal cchar=✓
syntax match luaNice "\~=" conceal cchar=≠
syntax match luaNice "==" conceal cchar=≡
syntax match luaNice "\.\." conceal cchar=+

hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=Magenta
