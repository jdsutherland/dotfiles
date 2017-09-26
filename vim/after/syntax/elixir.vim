syntax match elixirNiceOperator "|>" conceal cchar=▹
syntax match elixirNiceOperator "=\~" conceal cchar=∼
syntax match elixirNiceOperator ">=" conceal cchar=≥
syntax match elixirNiceOperator "<=" conceal cchar=≤
syntax match elixirNiceOperator "->" conceal cchar=→
syntax match elixirNiceOperator "=>" conceal cchar=⇒
syntax match elixirNiceOperator "<=>" conceal cchar=⇔
syntax match elixirNiceOperator "!=" conceal cchar=≠
syntax match elixirNiceOperator " \zs\*\ze " conceal cchar=×
syntax match elixirNiceOperator " \zs\/\ze " conceal cchar=÷
" syntax match elixirNiceOperator "==" conceal cchar=≡
syntax match elixirNiceOperator "=\@<!===\@!" conceal cchar=≈
syntax match elixirNiceOperator "=\@<!====\@!" conceal cchar=≣
syntax match elixirNiceOperator "&&" conceal cchar=∧
syntax match elixirNiceOperator "||" conceal cchar=∨
syntax match elixirNiceOperator "fn" conceal cchar=λ
syntax match elixirNiceOperator "<>" conceal cchar=⊙
syntax match elixirNiceOperator "++" conceal cchar=⊕
syntax match elixirNiceOperator "--" conceal cchar=⊝

syntax match elixirExUnitAssert "\(^\s*\)\@<=\<\(assert\|assert_in_delta\|assert_raise\|assert_receive\|assert_received\|catch_error\)\>" conceal cchar=✓
" syntax match elixirExUnitAssert "assert" conceal cchar=✓
syntax keyword elixirBoolean true conceal cchar=T
syntax keyword elixirBoolean false conceal cchar=F
syntax keyword elixirBoolean nil conceal cchar=∅
syntax match elixirNiceOperator "\v\.new>" conceal cchar=ミ
syntax match elixirNiceOperator "\v\.delete>" conceal cchar=✗
syntax match elixirNiceOperator "\v\.intersection>" conceal cchar=∩
syntax match elixirNiceOperator "\v\.union>" conceal cchar=∪
syntax match elixirNiceOperator "\zs&\ze(" conceal cchar=ƒ
" syntax keyword elixirSelf nil conceal cchar=@

highlight link elixirNiceOperator Operator
highlight! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightRed
