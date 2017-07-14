if exists('g:no_erlang_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax keyword erlangNiceOperator fun conceal cchar=λ

syntax match erlangNiceOperator "=:=" conceal cchar=≡
syntax match erlangNiceOperator "=/=" conceal cchar=≠
syntax match erlangNiceOperator "=<" conceal cchar=≤
syntax match erlangNiceOperator ">=" conceal cchar=≥

syntax match erlangNiceOperator "<-" conceal cchar=←
syntax match erlangNiceOperator "->" conceal cchar=→

syntax match erlangNiceOperator "++" conceal cchar=⧺

syntax match erlangNiceOperator "\<undefined\>" conceal cchar=⊥

hi link erlangNiceOperator Operator
hi! link Conceal Operator
"setlocal conceallevel=2
