" " we need the conceal feature (vim ≥ 7.3)
" if !has('conceal')
" 		finish
" endif

" syntax match goNiceOperator ">=" conceal cchar=≥
" syntax match goNiceOperator "<=" conceal cchar=≤
" syntax match goNiceOperator "->" conceal cchar=→
" syntax match goNiceOperator "<-" conceal cchar=˿
" syntax match goNiceOperator "=>" conceal cchar=⇒
" syntax match goNiceOperator "<=>" conceal cchar=⇔
" syntax match goNiceOperator "!=" conceal cchar=≠
" syntax match goNiceOperator " \zs\*\ze " conceal cchar=×
" syntax match goNiceOperator " \zs\/\ze " conceal cchar=÷
" syntax match goNiceOperator "==" conceal cchar=≡
" syntax match goNiceOperator "\[\]" conceal cchar=□
" syntax match goNiceOperator ":=" conceal cchar=≔
" " syntax match goNiceOperator "||" conceal cchar=∨
" " syntax match goNiceOperator "&&" conceal cchar=∧

" syntax match goNiceOperator /err == nil/ conceal cchar=✓
" syntax match goNiceOperator /err != nil/ conceal cchar=✗

" " syntax match goNiceOperator /!= ""/ conceal cchar=✓
" " syntax match goNiceOperator /== ""/ conceal cchar=∅

" syntax match goNiceOperator "\v\s\zs\*\ze[a-zA-Z]" conceal cchar=*
" " syntax match goNiceOperator "\zs\*\ze\w+" conceal cchar=*
" syntax match goNiceOperator "\zs&\ze\w\+" conceal cchar=&
" " syntax match goNiceOperator "," conceal cchar=,
" syntax match goNiceOperator "++" conceal cchar=Δ
" syntax match goNiceOperator "--" conceal cchar=∇
" " syntax match goNiceOperator " \zs\*\ze " conceal cchar=⨉
" " syntax match goNiceOperator " \zs\/\ze " conceal cchar=÷
" syntax match goNiceOperator "\.\.\." conceal cchar=…
" " syntax match goNiceOperator "\v\w+\zs\:\ze" conceal cchar=꞉
" " syntax match goNiceOperator "\v\w+\zs\:\ze" conceal cchar=⁝

" syntax keyword goNiceOperator lambda conceal cchar=λ
" syntax keyword goNiceOperator proc conceal cchar=π
" syntax keyword goNiceOperator function conceal cchar=ƒ contained
" " syntax match goType /\<func\>/ conceal cchar=ƒ
" " syntax match goDeclaration /^func\>/ conceal cchar=ƒ
" syntax keyword goDeclaration func conceal cchar=ƒ

" syntax keyword goConst const conceal cchar=𝔠
" syntax keyword goVar var conceal cchar=ℓ
" syntax keyword goPredefinedIdentifiers nil conceal cchar=∅

" " syntax keyword goType interface conceal cchar=𐊭
" " syntax keyword goType chan conceal cchar=ċ
" syntax keyword goType bool conceal cchar=ƀ
" syntax keyword goType byte conceal cchar=฿
" syntax keyword goType rune conceal cchar=ʀ
" syntax keyword goType string conceal cchar=⟆
" syntax keyword goType float32 conceal cchar=ℝ
" syntax keyword goType float64 conceal cchar=ℝ
" syntax keyword goType complex64 conceal cchar=ℂ
" syntax keyword goType complex128 conceal cchar=ℂ
" syntax keyword goType int conceal cchar=ℤ
" syntax keyword goType int16 int32 conceal cchar=ⅰ
" syntax keyword goType int64 conceal cchar=ⅱ
" syntax keyword goType uint16 uint32 conceal cchar=Ⅰ
" syntax keyword goType uint uint64 conceal cchar=Ⅱ
" syntax keyword goType error conceal cchar=ɇ

" syntax keyword goStatement return conceal cchar=⇚
" " syntax keyword goStatement break conceal cchar=↯
" " syntax keyword goStatement continue conceal cchar=↰
" " syntax keyword goStatement goto conceal cchar=↷
" syntax keyword goBoolean true conceal cchar=✓
" syntax keyword goBoolean false conceal cchar=✗

" syntax keyword goDeclaration type conceal cchar=₪
" " syntax keyword goDeclType interface conceal cchar=𐊭
" syntax keyword goDeclType interface conceal cchar=♀
" syntax keyword goDeclType struct conceal cchar=⊇
" " syntax keyword goImport import conceal cchar=ɪ
" syntax keyword goBuiltins len conceal cchar=#
" " syntax keyword goBuiltins := append conceal cchar=«
" " syntax keyword goBuiltins = append conceal cchar=«
" syntax match goBuiltins "\v:?\= append\((\w+(\.\w+)*)?," conceal cchar=«
" syntax keyword goBuiltins = append conceal cchar=«
" " syntax match goMethodCall "\w\+\.Assert\ze(" conceal cchar=✓
" syntax keyword goBuiltins make conceal cchar=μ
" syntax keyword goBuiltins new conceal cchar=μ
" syntax keyword goBuiltins delete conceal cchar=✗

" " syntax match goNiceOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
" " syntax match goNiceOperator /^}$/ conceal cchar=}
" syntax match goNiceOperator /^\s*\zs}\ze$/ conceal
" syntax match goNiceOperator /\(^\s*\)\@<=\zs}\ze\s*/ conceal
" syntax match goNiceOperator /\ *\zs{\ze$/ conceal

" hi link goNiceOperator Operator
" hi! link Conceal Operator
" hi! Conceal ctermbg=Black ctermfg=Magenta
