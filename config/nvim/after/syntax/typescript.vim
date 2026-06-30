" syntax keyword typescriptReserved export conceal cchar=+
" syntax keyword typescriptReserved import conceal cchar=ɪ
" syntax keyword typescriptImport from conceal cchar=∷
" syntax keyword typescriptClassExtends extends conceal cchar=<
" syntax keyword typescriptClassExtends implements conceal cchar=:
" syntax keyword typescriptReserved private conceal cchar=-
" syntax keyword typescriptReserved public conceal cchar=+
" syntax keyword typescriptReserved protected conceal cchar=~
" syntax keyword typescriptReserved type conceal cchar=₪
" syntax keyword typescriptReserved enum conceal cchar=∈
" syntax keyword typescriptReserved interface conceal cchar=♀
" syntax keyword typescriptReserved static conceal cchar=∬

" syntax keyword typescriptBoolean true conceal cchar=✓
" syntax keyword typescriptBoolean false conceal cchar=✗

" syntax keyword typescriptStatementKeyword return conceal cchar=⇚

" syntax keyword typescriptLabel default conceal cchar=d

" syntax keyword typescriptIdentifier this conceal cchar=@

" " TODO: doesn't work
" syntax match typescriptBraces "\[\]" conceal cchar=□

" " TODO: check if broke things
" syntax keyword typescriptIdentifierName string conceal cchar=⟆
" syntax keyword typescriptIdentifierName boolean conceal cchar=ƀ
" syntax keyword typescriptIdentifierName integer conceal cchar=ⅰ
" syntax keyword typescriptIdentifierName number conceal cchar=ℤ
" syntax keyword typescriptIdentifierName string conceal cchar=⟆
" syntax keyword typescriptIdentifierName object conceal cchar=ɵ
" syntax keyword typescriptIdentifierName unknown conceal cchar=?
" syntax keyword typescriptIdentifierName any conceal cchar=∃
" syntax keyword typescriptIdentifierName never conceal cchar=ñ
" syntax keyword typescriptIdentifierName void conceal cchar=⍉
" syntax keyword typeScriptPredefinedType string conceal cchar=⟆
" syntax keyword typeScriptPredefinedType boolean conceal cchar=ƀ
" syntax keyword typeScriptPredefinedType integer conceal cchar=ⅰ
" syntax keyword typeScriptPredefinedType number conceal cchar=ℤ
" syntax keyword typeScriptPredefinedType string conceal cchar=⟆
" syntax keyword typeScriptPredefinedType object conceal cchar=ɵ
" syntax keyword typeScriptPredefinedType unknown conceal cchar=?
" syntax keyword typeScriptPredefinedType any conceal cchar=∃
" syntax keyword typeScriptPredefinedType never conceal cchar=ñ
" syntax keyword typeScriptPredefinedType void conceal cchar=⍉

" syntax keyword typescriptNull null conceal cchar=∅
" syntax keyword typescriptNull undefined conceal cchar=¿

" syntax keyword typescriptVariable const conceal cchar=𝔠
" syntax keyword typescriptVariable let conceal cchar=ℓ
" syntax keyword typescriptOperator new conceal cchar=μ
" syntax keyword typescriptFuncKeyword function conceal cchar=ƒ

" syntax match typescriptBinaryOp "\s\zs<=\ze\s" conceal cchar=≤
" syntax match typescriptBinaryOp "\s\zs>=\ze\s" conceal cchar=≥
" syntax match typescriptBinaryOp "=\@<!===\@!" conceal cchar=≈
" syntax match typescriptBinaryOp "=\@<!====\@!" conceal cchar=≣
" syntax match typescriptBinaryOp "\s\zs!=\ze\s" conceal cchar=≠
" syntax match typescriptBinaryOp "\s\+\zs!==\ze\s\+" conceal cchar=≢

" syntax keyword typescriptAsyncFuncKeyword async conceal cchar=Å
" syntax keyword typescriptAsyncFuncKeyword await conceal cchar=å
" syntax keyword typescriptObjectAsyncKeyword async conceal cchar=Å

" syntax keyword typescriptLabel async conceal cchar=Å
" syntax keyword typescriptBranch await conceal cchar=å

" " TODO: doesn't work if preceeded by `async` or `return`
" syntax match typescriptArrowFunc /=>/ skipwhite skipempty nextgroup=typeScriptFuncCallArg,typescriptBraces conceal cchar=⇒

" syntax keyword typescriptDOMFormProp length conceal cchar=#
" syntax match typescriptRestOrSpread "\.\.\." conceal cchar=…
" syntax match typescriptBlock /;$/ conceal

" " link conceal groups to actual to keep colors
" hi link typescriptReserved typescriptReserved
" hi link typescriptBraces typescriptBraces
" hi link typescriptOpSymbols typescriptOpSymbols
" hi link typescriptStatement typescriptStatement
" hi link typescriptIdentifier typescriptIdentifier
" hi link typescriptOperator typescriptOperator
" hi link typescriptNull typescriptNull
" hi link typescriptBranch typescriptBranch
" hi link typescriptLabel typescriptLabel
" hi link typescriptFuncKeyword typescriptFuncKeyword
" hi link typescriptType typescriptType
" hi link typescriptStorageClass typescriptStorageClass

" hi! Conceal guifg=LightRed
