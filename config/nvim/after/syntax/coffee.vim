if exists('g:no_coffee_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax match coffeeNiceOperator "->" conceal cchar=→
syntax match coffeeNiceOperator "=>" conceal cchar=⇒
syntax match coffeeNiceOperator "!=" conceal cchar=≠

syntax match coffeeNiceOperator "==" conceal cchar=≡
syntax match coffeeNiceOperator "!=" conceal cchar=≠
syntax match coffeeNiceOperator "<=\ze[^<>]" conceal cchar=≲
syntax match coffeeNiceOperator ">=\ze[^<>]" conceal cchar=≳
syntax match coffeeNiceOperator "\s\zs<<\ze\s" conceal cchar=« " make sure we don't break heredocs
syntax match coffeeNiceOperator ">>" conceal cchar=»

hi link coffeeNiceOperator Operator
hi! link Conceal Operator
"setlocal conceallevel=2
