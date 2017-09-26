if exists('g:no_scala_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax match scalaNiceOperator "<-" conceal cchar=←
syntax match scalaNiceOperator "->" conceal cchar=→
syntax match scalaNiceOperator "==" conceal cchar=≟
syntax match scalaNiceOperator "===" conceal cchar=≡
syntax match scalaNiceOperator "!=" conceal cchar=≠
syntax match scalaNiceOperator "=/=" conceal cchar=≢
syntax match scalaNiceOperator ">>" conceal cchar=»
syntax match scalaNiceOperator "&&" conceal cchar=∧
syntax match scalaNiceOperator "||" conceal cchar=∨
syntax match scalaNiceOperator "\v<length\(\)" conceal cchar=#
syntax match scalaNiceOperator "*" conceal cchar=⁕

syntax match scalaNiceOperator "++" conceal cchar=Δ
syntax match scalaNiceOperator "--" conceal cchar=∇
syntax match scalaNiceOperator " \zs\*\ze " conceal cchar=⨉
syntax match scalaNiceOperator " \zs\/\ze " conceal cchar=÷
syntax match scalaNiceOperator "\.\.\." conceal cchar=…

syntax keyword scalaKeywordModifier private conceal cchar=⌾
syntax keyword scalaKeywordModifier override conceal cchar=⎆
syntax keyword scalaKeywordModifier protected conceal cchar=◈
" syntax keyword javaNiceKeyword break conceal cchar=↯

syntax keyword scalaKeyword return conceal cchar=⇚
syntax keyword scalaKeyword var conceal cchar=@
syntax keyword scalaKeyword val conceal cchar=𝔠
syntax keyword scalaSpecial true conceal cchar=T
syntax keyword scalaSpecial false conceal cchar=F
syntax keyword scalaSpecial new conceal cchar=μ
syntax keyword scalaTypeDeclaration type conceal cchar=₪
syntax keyword scalaKeyword extends conceal cchar=<

let s:extraConceal = 1

if s:extraConceal
    " Match greater than and lower than w/o messing with Kleisli composition
    syntax match scalaNiceOperator "<=\ze[^<]" conceal cchar=≤
    syntax match scalaNiceOperator ">=\ze[^>]" conceal cchar=≥

    syntax match scalaNiceOperator "=>" conceal cchar=⇒
		syntax match scalaNiceOperator "!=" conceal cchar=≠
    syntax match scalaNiceOperator "=\zs<<" conceal cchar=«

    " Redfining to get proper '::' concealing
    syntax match hs_DeclareFunction /^[a-z_(]\S*\(\s\|\n\)*::/me=e-2 nextgroup=scalaNiceOperator contains=hs_FunctionName,hs_OpFunctionName
    syntax match scalaNiceOperator "\:\:" conceal cchar=∷

    syntax match scalaNiceOperator "forall" conceal cchar=∀

    "syntax match scalaNiceOperator /\s\.\s/ms=s+1,me=e-1 conceal cchar=∘
    syntax match scalaNiceOperator "map\ze[ ({]" conceal cchar=∘
    syntax match scalaNiceOperator "flatMap\ze[ ({]" conceal cchar=⤜

    syntax match scalaNiceOperator "exists" conceal cchar=∈
endif

" syntax match scalaNiceOperator /^\s*\zs}\ze$/ conceal
" syntax match scalaNiceOperator /\(^\s*\)\@<=\zs}\ze\s*/ conceal
" syntax match scalaNiceOperator /^}$/ conceal cchar=}
" syntax match scalaNiceOperator /\ *\zs{\ze$/ conceal
" syntax match scalaNiceOperator /;$/ conceal

hi link scalaNiceOperator Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=Magenta

