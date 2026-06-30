" if exists('g:no_javascript_conceal') || !has('conceal') || &enc != 'utf-8'
" 	finish
" endif

" " syntax match jsOperator "\s\+=>\s\+" conceal cchar=⇒
" syntax match jsOperator "=\~" conceal cchar=≅
" syntax match jsOperator "!\~" conceal cchar=≆
" syntax match jsOperator "++" conceal cchar=Δ
" syntax match jsOperator "--" conceal cchar=∇
" " syntax match jsOperator "&&" conceal cchar=∧
" " syntax match jsOperator "||=\@!" conceal cchar=∨
" " syntax match jsOperator "||=" conceal cchar=⊫
" " syntax match jsOperator " \zs\*\ze " conceal cchar=⨉
" " syntax match jsOperator " \zs\/\ze "  conceal cchar=÷

" " distinguish lines beginning with method chains
" syntax match jsOperator "\s\+\zs\.\ze"  conceal cchar=｡

" " syntax match jsGenerator "*" conceal cchar=⁕

" " FOO.length => FOO#
" syntax keyword jsfuncCall length conceal cchar=#
" " syntax keyword jsFuncCall forEach conceal cchar=∀
" " syntax keyword jsFuncCall filter conceal cchar=∿
" " syntax keyword jsFuncCall reduce conceal cchar=λ
" " syntax keyword jsFuncCall map conceal cchar=⚨
" syntax keyword jsFuncCall assert conceal cchar=✓
" syntax match jsOperator "assert" conceal cchar=✓
" " syntax keyword jsFuncCall every conceal cchar=∀
" " syntax keyword jsFuncCall some conceal cchar=∃
" " syntax keyword jsFuncCall push conceal cchar=«
" " syntax keyword jsFuncCall pop conceal cchar=»
" " syntax keyword jsFuncCall setTimeout conceal cchar=◴

" syntax keyword jsOperator typeof conceal cchar=₪
" " syntax keyword jsOperator delete conceal cchar=✗

" " rest/spread
" syntax match jsOperator "\.\.\." conceal cchar=…
" syntax match jsSpreadExpression "\.\.\." conceal cchar=…
" syntax match jsRestExpression "\.\.\." conceal cchar=…

" syntax match jsOperator "\s\zs<=\ze\s" conceal cchar=≤
" syntax match jsOperator "\s\zs>=\ze\s" conceal cchar=≥
" " syntax match jsOperator /![^=]/me=e-1 conceal cchar=¬
" syntax match jsOperator "\<not\>" conceal cchar=¬
" syntax keyword jsOperator in conceal cchar=∈
" syntax keyword jsStatement extends conceal cchar=<
" syntax keyword jsStatement new conceal cchar=μ
" syntax match jsOperator "=\@<!===\@!" conceal cchar=≈
" syntax match jsOperator "=\@<!====\@!" conceal cchar=≣
" syntax match jsOperator "\s\zs!=\ze\s" conceal cchar=≠
" syntax match jsOperator "\s\+\zs!==\ze\s\+" conceal cchar=≢

" " syntax match jsOperator "\s^\s" conceal cchar=⊻

" syntax keyword jsBooleanTrue true conceal cchar=✓
" syntax keyword jsBooleanFalse false conceal cchar=✗

" syntax keyword jsStorageClass const conceal cchar=𝔠
" " syntax match jsStorageClass "\<const\s\+" conceal
" syntax keyword jsStorageClass let conceal cchar=ℓ
" syntax keyword jsStorageClass var conceal cchar=𝓋
" syntax keyword jsClassMethodType static conceal cchar=∬
" syntax keyword jsGlobalObjects Promise conceal cchar=Ƥ

" syntax keyword jsAsyncKeyword async conceal cchar=ÅⱣ
" syntax keyword jsAsyncKeyword await conceal cchar=å

" syntax keyword jsStatement export conceal cchar=+
" syntax keyword jsStatement default conceal cchar=d
" syntax keyword jsStatement import conceal cchar=ɪ
" " syntax match jsStatement "\sfrom\ze\s" conceal cchar=ｆ
" syntax match jsStatement "\s\zsfrom\ze\s" conceal cchar=∷

" syntax keyword jsGlobalObjects Boolean conceal cchar=ƀ
" syntax keyword jsGlobalObjects Integer conceal cchar=ⅰ
" syntax keyword jsGlobalObjects Number conceal cchar=ℤ
" syntax keyword jsGlobalObjects String conceal cchar=⟆
" syntax keyword jsGlobalObjects Array conceal cchar=⌸
" syntax keyword jsGlobalObjects Object conceal cchar=ɵ

" " from vim-javascript
" syntax keyword jsFunction function conceal cchar=ƒ
" syntax keyword jsNull null conceal cchar=∅
" syntax keyword jsThis this conceal cchar=@
" syntax keyword jsReturn return conceal cchar=⇚
" syntax keyword jsUndefined undefined conceal cchar=¿
" syntax keyword jsNan NaN conceal cchar=ℕ
" syntax keyword jsEquality conceal cchar=≡
" syntax keyword jsPrototype conceal cchar=¶
" syntax keyword jsStatic conceal cchar=∬
" syntax keyword jsSuper conceal cchar=Ω
" syntax match jsArrowFunction /=>/ skipwhite skipempty nextgroup=jsFuncBlock,jsCommentFunction conceal cchar=⇒

" syntax match jsGlobalObjects "\<boolean\>" conceal cchar=ƀ
" " syntax match jsGlobalObjects "\<number\>" conceal cchar=ℤ
" syntax match jsGlobalObjects "\<string\>" conceal cchar=⟆
" syntax keyword jsNumber Infinity conceal cchar=∞
" syntax match jsNumber "\<infinity\>" conceal cchar=∞

" syntax keyword jsGlobalNodeObjects module conceal cchar=ᴍ
" syntax match   jsGlobalObjects  "\<require\>" conceal cchar=ʀ

" syntax match jsNoise /;$/ conceal
" " syntax match jsNoise /,$/ conceal

" syntax keyword jsStatement break conceal cchar=↯
" syntax keyword jsStatement continue conceal cchar=↰

" hi! link Conceal Operator
" " hi! Conceal ctermbg=Black ctermfg=Magenta
" hi! Conceal guifg=LightRed
" " #80c674

" " hi! Conceal ctermbg=Black ctermfg=239
" "setlocal conceallevel=2
