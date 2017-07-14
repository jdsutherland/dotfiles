if exists('g:no_ruby_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax keyword rubySymbol lambda conceal cchar=λ

syntax match rubySymbol "=>" conceal cchar=⇒
syntax match rubySymbol "!=" conceal cchar=≠
syntax match rubySymbol "=\~" conceal cchar=≅
syntax match rubySymbol "!\~" conceal cchar=≆

syntax match rbNiceOperator " \* "  conceal cchar=×
syntax match rbNiceOperator " \/ "  conceal cchar=÷

syntax keyword rbNiceOperator not conceal cchar=¬
syntax match rbNiceOperator "\s\+\zs!\ze[! ]\@!" conceal cchar=¬
syntax match rubyOperator "||=" conceal cchar=⊫
syntax match rbNiceOperator "&&" conceal cchar=∧
syntax match rbNiceOperator "||=\@!" conceal cchar=∨
syntax match rbNiceOperator "&&\@!" conceal cchar=&
syntax match cNiceOperator "*" conceal cchar=⁕
" syntax keyword rbNiceOperator and conceal cchar=∧
" syntax keyword rbNiceOperator or conceal cchar=∨

syntax keyword rubyBoolean true conceal cchar=T
syntax keyword rubyBoolean false conceal cchar=F

syntax match rubySymbol "==" conceal cchar=≡
syntax match rubySymbol "!=" conceal cchar=≠
syntax match rubySymbol "<=\ze[^<>]" conceal cchar=≲
syntax match rubySymbol ">=\ze[^<>]" conceal cchar=≳
syntax match rubySymbol "\s\zs<<\ze\s" conceal cchar=« " make sure we don't break heredocs
syntax match rubySymbol ">>" conceal cchar=»
syntax match rubyOperator "<=>" conceal cchar=⇔
syntax keyword rubyPseudoVariable nil conceal cchar=∅
syntax keyword rubyPseudoVariable self conceal cchar=@
" syntax match rubyString "\:\:" conceal cchar=∷
syntax match rbNiceOperator "\.new" conceal cchar=μ

" syntax match rbNiceOperator '\.'

syntax match rbDelimiter  "(\|)\|\[\|\]\|,\|;\|{\|}"

hi link rbNiceOperator Operator
hi link rbDelimiter Delimiter
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=16
"setlocal conceallevel=2
