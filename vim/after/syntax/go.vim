" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
		finish
endif

syntax match goNiceOperator ">=" conceal cchar=≥
syntax match goNiceOperator "<=" conceal cchar=≤
syntax match goNiceOperator "->" conceal cchar=→
syntax match goNiceOperator "<-" conceal cchar=˿
syntax match goNiceOperator "=>" conceal cchar=⇒
syntax match goNiceOperator "<=>" conceal cchar=⇔
syntax match goNiceOperator "!=" conceal cchar=≠
syntax match goNiceOperator " \zs\*\ze " conceal cchar=×
syntax match goNiceOperator " \zs\/\ze " conceal cchar=÷
syntax match goNiceOperator "==" conceal cchar=≡
syntax match goNiceOperator ":=" conceal cchar=≔
syntax match goNiceOperator "||" conceal cchar=∨
syntax match goNiceOperator "&&" conceal cchar=∧

syntax match goNiceOperator "*" conceal cchar=⁕
syntax match goNiceOperator "\zs&\ze\w\+" conceal cchar=&
syntax match goNiceOperator "++" conceal cchar=Δ
syntax match goNiceOperator "--" conceal cchar=∇
syntax match goNiceOperator " \zs\*\ze " conceal cchar=⨉
syntax match goNiceOperator " \zs\/\ze " conceal cchar=÷
syntax match goNiceOperator "\.\.\." conceal cchar=…

syntax keyword goNiceOperator lambda conceal cchar=λ
syntax keyword goNiceOperator proc conceal cchar=π
" syntax keyword goNiceOperator function conceal cchar=ƒ contained
" syntax match goType /\<func\>/ conceal cchar=ƒ
" syntax match goDeclaration /^func\>/ conceal cchar=ƒ
syntax keyword goNiceOperator func conceal cchar=ƒ
syntax keyword goType const conceal cchar=𝔠
syntax keyword goType var conceal cchar=ⱴ

syntax keyword goStatement return conceal cchar=⇚
syntax keyword goStatement break conceal cchar=↴
syntax keyword goStatement continue conceal cchar=↰
syntax keyword goStatement goto conceal cchar=↷
syntax keyword goBoolean true conceal cchar=T
syntax keyword goBoolean false conceal cchar=F

syntax keyword goType nil conceal cchar=∅
syntax keyword goDeclType struct conceal cchar=⊇
syntax keyword goDirective import conceal cchar=ɪ
syntax keyword goBuiltins len conceal cchar=#
syntax keyword goBuiltins append conceal cchar=«

" syntax match goNiceOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
" syntax match goNiceOperator /^\s*}$/ conceal
" syntax match goNiceOperator /\(^\s*\)\@<=}\s*/ conceal
" syntax match goNiceOperator /\ *{$/ conceal

hi link goNiceOperator Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=Magenta
