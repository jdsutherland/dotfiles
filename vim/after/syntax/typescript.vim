" TODO: see if workable to fix !==, !=
" syntax clear tsxNotOperator

" NOTE: c prefix means conceal

syntax keyword cTypescriptReserved export conceal cchar=E
syntax keyword cTypescriptReserved import conceal cchar=ɪ
syntax match cTypescriptReserved "\sfrom\s" conceal cchar=ｆ
syntax keyword cTypescriptReserved extends conceal cchar=<
syntax keyword cTypescriptReserved type conceal cchar=₪
syntax keyword cTypescriptReserved enum conceal cchar=∈
syntax keyword cTypescriptReserved interface conceal cchar=♀

syntax keyword cTypescriptStatement return conceal cchar=⇚

" TODO: keep?
" syntax keyword cTypescriptLabel async conceal cchar=Å
" syntax keyword cTypescriptBranch await conceal cchar=å

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

syntax keyword cTypescriptOperator new conceal cchar=μ

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

" not linked (new defs)
syntax match cArrowFunction "\s\zs=>\ze" conceal cchar=⇒
syntax keyword cTsNice length conceal cchar=#
syntax keyword cTsNice Promise conceal cchar=Ƥ
syntax match cTsNice "\.\.\." conceal cchar=…
syntax match cTsNice /;$/ conceal

" TODO: decide color
hi! Conceal guifg=LightRed
