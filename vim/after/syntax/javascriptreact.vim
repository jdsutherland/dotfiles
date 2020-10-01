if exists('g:no_javascript_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax match jsxAttrib "\<className\>" conceal cchar=ℂ

hi! link Conceal Operator
hi! Conceal guifg=LightRed
