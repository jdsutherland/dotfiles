" TODO: see if workable to fix !==, !=
" syntax clear tsxNotOperator

" NOTE: c prefix means conceal

" typescript-vim {{{
syntax keyword cTypescriptReserved export conceal cchar=E
syntax keyword cTypescriptReserved import conceal cchar=ɪ
" syntax match cTypescriptReserved "\<from\ze\s" conceal cchar=ｆ
syntax keyword cTypescriptReserved extends conceal cchar=<
syntax keyword cTypescriptReserved private conceal cchar=-
syntax keyword cTypescriptReserved type conceal cchar=₪
syntax keyword cTypescriptReserved enum conceal cchar=∈
syntax keyword cTypescriptReserved interface conceal cchar=♀

syntax keyword cTypescriptStatement return conceal cchar=⇚

" TODO: keep?
syntax keyword cTypescriptLabel default conceal cchar=d
syntax keyword cTypescriptLabel async conceal cchar=Å
syntax keyword cTypescriptBranch await conceal cchar=å

syntax keyword cTypescriptIdentifier this conceal cchar=@

syntax keyword cTypescriptType string conceal cchar=⟆
syntax keyword cTypescriptType boolean conceal cchar=ƀ
syntax keyword cTypescriptType integer conceal cchar=ⅰ
syntax keyword cTypescriptType number conceal cchar=ℤ
syntax keyword cTypescriptType string conceal cchar=⟆
syntax keyword cTypescriptType object conceal cchar=ɵ
syntax keyword cTypescriptType unknown conceal cchar=?
syntax keyword cTypescriptType any conceal cchar=∃
syntax keyword cTypescriptType never conceal cchar=ñ
syntax keyword cTypescriptType void conceal cchar=⍉

syntax keyword cTypescriptNull null conceal cchar=∅
syntax keyword cTypescriptNull undefined conceal cchar=¿

syntax keyword cTypescriptStorageClass const conceal cchar=𝔠
syntax keyword cTypescriptStorageClass let conceal cchar=ʟ

" syntax keyword cTypescriptOperator new conceal cchar=μ

syntax keyword cTypescriptFuncKeyword function conceal cchar=ƒ

syntax match cTypescriptOpSymbols "\s\zs<=\ze\s" conceal cchar=≤
syntax match cTypescriptOpSymbols "\s\zs>=\ze\s" conceal cchar=≥
syntax match cTypescriptOpSymbols "=\@<!===\@!" conceal cchar=≈
syntax match cTypescriptOpSymbols "=\@<!====\@!" conceal cchar=≣
" d/n work b/c tsxNotOperator
syntax match cTypescriptOpSymbols "\s\zs!=\ze\s" conceal cchar=≠
syntax match cTypescriptOpSymbols "\s\+\zs!==\ze\s\+" conceal cchar=≢

" link conceal groups to actual to keep colors
hi link cTypescriptReserved typescriptReserved
hi link cTypescriptOpSymbols typescriptOpSymbols
hi link cTypescriptStatement typescriptStatement
hi link cTypescriptIdentifier typescriptIdentifier
hi link cTypescriptOperator typescriptOperator
hi link cTypescriptNull typescriptNull
hi link cTypescriptBranch typescriptBranch
hi link cTypescriptLabel typescriptLabel
hi link cTypescriptFuncKeyword typescriptFuncKeyword
hi link cTypescriptType typescriptType
hi link ctypescriptStorageClass typescriptStorageClass
" TODO: see if fixable !==, != (see L1)
" highlight def link tsxNotOperator typescriptEndColons

" }}}

" " yats {{{
" syntax keyword cTypescriptInterfaceExtends extends conceal cchar=<
" syntax keyword cTypescriptAliasKeyword type conceal cchar=₪
" syntax keyword cTypescriptEnumKeyword enum conceal cchar=∈
" syntax keyword cTypescriptInterfaceKeyword interface conceal cchar=♀

" syntax keyword cTypescriptStatementKeyword return conceal cchar=⇚

" " TODO: keep?
" syntax keyword cTypescriptAsyncFuncKeyword async conceal cchar=Å
" syntax keyword cTypescriptAsyncFuncKeyword await conceal cchar=å

" syntax keyword cTypescriptIdentifier this conceal cchar=@

" syntax keyword cTypeScriptPredefinedType string conceal cchar=⟆
" syntax keyword cTypeScriptPredefinedType boolean conceal cchar=ƀ
" syntax keyword cTypeScriptPredefinedType integer conceal cchar=ⅰ
" syntax keyword cTypeScriptPredefinedType number conceal cchar=ℤ
" syntax keyword cTypeScriptPredefinedType string conceal cchar=⟆
" syntax keyword cTypeScriptPredefinedType object conceal cchar=ɵ
" syntax keyword cTypeScriptPredefinedType unknown conceal cchar=?
" syntax keyword cTypeScriptPredefinedType any conceal cchar=∃
" syntax keyword cTypeScriptPredefinedType never conceal cchar=ñ
" syntax keyword cTypeScriptPredefinedType void conceal cchar=⍉

" syntax keyword cTypescriptNull null conceal cchar=∅
" syntax keyword cTypescriptNull undefined conceal cchar=¿

" " TODO
" syntax keyword cTypescriptStorageClass const conceal cchar=𝔠
" syntax keyword cTypescriptVariable const conceal cchar=𝔠
" syntax keyword cTypescriptVariable let conceal cchar=ʟ
" syntax keyword cTypescriptAccessibilityModifier private conceal cchar=-
" syntax keyword cTypescriptAccessibilityModifier protected conceal cchar=ᴘ
" syntax keyword cTypescriptAccessibilityModifier static conceal cchar=∬

" " TODO
" syntax keyword cTypescriptOperator new conceal cchar=μ

" syntax keyword cTypescriptFuncKeyword function conceal cchar=ƒ
" syntax match cTypescriptFuncTypeArrow "\s\zs=>\ze" conceal cchar=⇒

" " link conceal groups to actual to keep colors
" hi link cTypescriptInterfaceExtends typescriptInterfaceExtends
" hi link cTypescriptAliasKeyword typescriptAliasKeyword
" hi link cTypescriptEnumKeyword typescriptEnumKeyword
" hi link cTypescriptInterfaceKeyword typescriptInterfaceKeyword
" hi link cTypescriptAsyncFuncKeyword typescriptAsyncFuncKeyword
" hi link cTypescriptIdentifier typescriptIdentifier
" hi link cTypeScriptPredefinedType typeScriptPredefinedType
" hi link cTypescriptNull typescriptNull
" hi link cTypescriptStatementKeyword typescriptStatementKeyword
" hi link cTypescriptOperator typescriptOperator
" hi link cTypescriptFuncKeyword typescriptFuncKeyword
" hi link ctypescriptStorageClass typescriptStorageClass
" hi link cTypescriptVariable typescriptVariable
" hi link cTypescriptAccessibilityModifier typescriptAccessibilityModifier
" hi link cTypescriptFuncTypeArrow typescriptFuncTypeArrow
" " TODO: see if fixable !==, != (see L1)
" " highlight def link tsxNotOperator typescriptEndColons
" " }}}

" not linked (new defs)
syntax match cArrowFunction "\s\zs=>\ze" conceal cchar=⇒
syntax keyword cTsNice length conceal cchar=#
syntax keyword cTsNice Promise conceal cchar=Ƥ
syntax match cTsNice "\.\.\." conceal cchar=…
syntax match cTsNice /;$/ conceal

" TODO: decide color
hi! Conceal guifg=LightRed
