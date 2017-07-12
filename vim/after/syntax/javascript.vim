if exists('g:no_ruby_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif

" syntax match jsOperator "\s\+=>\s\+" conceal cchar=⇒
syntax match jsOperator "=\~" conceal cchar=≅
syntax match jsOperator "!\~" conceal cchar=≆
syntax match jsOperator "++" conceal cchar=Δ
syntax match jsOperator "--" conceal cchar=∇
syntax match jsOperator "&&" conceal cchar=∧
syntax match jsOperator "||" conceal cchar=∨
syntax match jsOperator " \zs\*\ze " conceal cchar=⨉
syntax match jsOperator " \zs\/\ze "  conceal cchar=÷

" distinguish lines beginning with method chains
syntax match jsOperator "\s\+\zs\.\ze"  conceal cchar=｡

syntax match jsGenerator "*" conceal cchar=⁕

" FOO.length => FOO#
syntax match jsNoise "\w*\zs\.length\ze\>" conceal cchar=#
syntax match jsFuncCall "\w*\zs\.forEach\ze(" conceal cchar=∫
syntax match jsFuncCall "\w*\zs\.filter\ze(" conceal cchar=∿
syntax match jsFuncCall "\w*\zs\.reduce\ze(" conceal cchar=λ
syntax match jsFuncCall "\w*\zs\.every\ze(" conceal cchar=∀
syntax match jsFuncCall "\w*\zs\.some\ze(" conceal cchar=∃
syntax match jsFuncCall "\w*\zs\.push\ze(" conceal cchar=«
syntax match jsFuncCall "\w*\zs\.pop()" conceal cchar=»

" rest/spread
syntax match jsNoise "\.\.\." conceal cchar=…

syntax match jsOperator "\s\zs<=\ze\s" conceal cchar=≤
syntax match jsOperator "\s\zs>=\ze\s" conceal cchar=≥
syntax match jsOperator /![^=]/me=e-1 conceal cchar=¬
syntax match jsOperator "\<not\>" conceal cchar=¬
syntax keyword jsOperator in conceal cchar=∈
syntax keyword jsExtendsKeyword extends conceal cchar=<
syntax keyword jsOperator new conceal cchar=μ
syntax match jsOperator "=\@<!===\@!" conceal cchar=≡
syntax match jsOperator "=\@<!====\@!" conceal cchar=≣
syntax match jsOperator "\s\+!=\s\+" conceal cchar=≠
syntax match jsOperator "\s\+\zs!==\ze\s\+" conceal cchar=≢
syntax match jsOperator "\s\+\zs!==\ze\s\+" conceal cchar=≢

" syntax match jsOperator "\s^\s" conceal cchar=⊻

syntax keyword jsBooleanTrue true conceal cchar=T
syntax keyword jsBooleanFalse false conceal cchar=F

syntax keyword jsStorageClass const conceal cchar=𝔠
syntax keyword jsStorageClass let conceal cchar=ʟ
" syntax keyword jsStorageClass var conceal cchar=ⱽ
" syntax keyword jsKeyword static conceal cchar=∬
syntax keyword jsGlobalObjects Promise conceal cchar=Ᵽ

syntax keyword jsAsyncKeyword async conceal cchar=Å
syntax keyword jsAsyncKeyword await conceal cchar=å

syntax keyword jsExport export conceal cchar=E
syntax keyword jsImport import conceal cchar=ɪ

syntax match jsGlobalObjects "\<Boolean\>" conceal cchar=𝔹
syntax match jsGlobalObjects "\<Integer\>" conceal cchar=ℤ
syntax match jsGlobalObjects "\<String\>" conceal cchar=∬
syntax match jsGlobalObjects "\<Array\>" conceal cchar=⌸
" 𝒜
syntax match jsGlobalObjects "\<Number\>" conceal cchar=ℜ
syntax match jsGlobalObjects "\<boolean\>" conceal cchar=𝔹
" syntax match jsGlobalObjects "\<number\>" conceal cchar=ℜ
" syntax match jsGlobalObjects "\<string\>" conceal cchar=∬
syntax match jsNumber "\<Infinity\>" conceal cchar=∞
syntax match jsNumber "\<infinity\>" conceal cchar=∞

syntax keyword jsGlobalNodeObjects module conceal cchar=ᴍ
syntax match   jsGlobalObjects  "\<require" conceal cchar=ʀ

syntax match jsNoise /;$/ conceal
" syntax match jsNoise /,$/ conceal

syntax keyword jsStatement break conceal cchar=↴
syntax keyword jsStatement continue conceal cchar=↰

hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=Magenta
setlocal conceallevel=2
