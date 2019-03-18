if exists('g:no_ruby_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

syntax keyword rubySymbol lambda conceal cchar=λ
syntax match rubyOperator "->" conceal cchar=λ
" syntax keyword rubyControl return conceal cchar=⇚

" syntax match rubySymbol "=>" conceal cchar=⇒
" syntax match rbNiceOperator "\v\zs:\ze\s+\S+" conceal cchar=⁝
syntax match rubySymbol "!=" conceal cchar=≠
syntax match rubySymbol "=\~" conceal cchar=≅
syntax match rubySymbol "!\~" conceal cchar=≆

syntax match rbNiceOperator " \zs\*\ze "  conceal cchar=×
syntax match rbNiceOperator " \zs\/\ze "  conceal cchar=÷

syntax keyword rbNiceOperator not conceal cchar=¬
syntax match rbNiceOperator "\s\+\zs!\ze[! ]\@!" conceal cchar=¬
syntax match rubyOperator "||=" conceal cchar=⊫
syntax match rbNiceOperator "&&" conceal cchar=∧
syntax match rbNiceOperator "||=\@!" conceal cchar=∨
syntax match rbNiceOperator "&&\@!" conceal cchar=&
syntax match rbNiceOperator " \zs\*\ze[a-zA-Z]" conceal cchar=⁕
syntax match rbNiceOperator " \zs\*\ze " conceal cchar=⨉
" syntax keyword rbNiceOperator and conceal cchar=∧
" syntax keyword rbNiceOperator or conceal cchar=∨

syntax keyword rubyBoolean true conceal cchar=T
syntax keyword rubyBoolean false conceal cchar=F

" syntax match rubySymbol "===" conceal cchar=≡
syntax match rubySymbol "=\@<!===\@!" conceal cchar=≈
syntax match rubySymbol "=\@<!====\@!" conceal cchar=≣
syntax match rubySymbol "!=" conceal cchar=≠
syntax match rubySymbol "<=\ze[^<>]" conceal cchar=≤
syntax match rubySymbol ">=\ze[^<>]" conceal cchar=≥
syntax match rubySymbol "\s\zs<<\ze\s" conceal cchar=« " make sure we don't break heredocs
syntax match rubySymbol ">>" conceal cchar=»
" syntax match rbNiceOperator "\.pop()\|\.pop" conceal cchar=»
syntax match rubyOperator "<=>" conceal cchar=⇔
syntax keyword rubyPseudoVariable nil conceal cchar=∅
syntax keyword rubyPseudoVariable self conceal cchar=@
" syntax match rubyString "\:\:" conceal cchar=∷
syntax match rubyOperator "\v\.new>" conceal cchar=ミ
syntax match rubyDefine "\s\?\<end\>" conceal

" syntax match rbNiceOperator '\.'

syntax match rbDelimiter  "(\|)\|\[\|\]\|,\|;\|{\|}"
syntax match rubyOperator "\s\+\zs\.\ze"  conceal cchar=｡

hi link rbNiceOperator Operator
hi link rbDelimiter Delimiter
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=16
"setlocal conceallevel=2
