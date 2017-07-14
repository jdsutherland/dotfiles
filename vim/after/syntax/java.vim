if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match javaNiceOperator "*" conceal cchar=⁕
syntax match javaNiceOperator "==" conceal cchar=≟
syntax match javaNiceOperator "!=" conceal cchar=≠
syntax match javaNiceOperator "<=" conceal cchar=≤
syntax match javaNiceOperator ">=" conceal cchar=≥
syntax match javaNiceOperator "++" conceal cchar=⧺
syntax match javaNiceOperator "--" conceal cchar=╌
syntax match javaNiceOperator "||" conceal cchar=⋁
syntax match javaNiceOperator "&&" conceal cchar=⋀
syntax match javaNiceOperator "->" conceal cchar=⇾

syntax match javaNiceFunction "assertEquals" conceal cchar=≡

let s:extraConceal = 1
if s:extraConceal
  syntax keyword javaNiceConstant null conceal cchar=⍉

  syntax keyword javaNiceKeyword break conceal cchar=↯
  syntax keyword javaNiceKeyword case conceal cchar=↳
  syntax keyword javaNiceKeyword class conceal cchar=₡
  syntax keyword javaNiceKeyword const conceal cchar=ℂ
  syntax keyword javaNiceKeyword continue conceal cchar=↟
  syntax keyword javaNiceKeyword else conceal cchar=⦂
  syntax keyword javaNiceKeyword final conceal cchar=⇥
  syntax keyword javaNiceKeyword for conceal cchar=∀
  syntax keyword javaNiceKeyword if conceal cchar=⁇
  syntax keyword javaNiceKeyword public conceal cchar=▶
  syntax keyword javaNiceKeyword protected conceal cchar=◈
  syntax keyword javaNiceKeyword private conceal cchar=▣
  syntax keyword javaNiceKeyword return conceal cchar=⇚
  syntax keyword javaNiceKeyword static conceal cchar=∬
  syntax keyword javaNiceKeyword switch conceal cchar=⋔
  syntax keyword javaNiceKeyword throw conceal cchar=⇪

  syntax keyword javaNiceBoolean true conceal cchar=Ƭ
  syntax keyword javaNiceBoolean false conceal cchar=ƒ

  " syntax keyword javaNiceType void conceal cchar=∅
  " syntax keyword javaNiceType char conceal cchar=ⅽ
  " syntax keyword javaNiceType int conceal cchar=ⅰ

  syntax match javaHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
  syntax match javaHiddenOperator /^\s*}$/ conceal
  syntax match javaHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
  syntax match javaHiddenOperator /\ *{$/ conceal
  syntax match javaHiddenOperator /;$/ conceal
endif

hi link javaNiceConstant Constant
hi link javaNiceKeyword Keyword
hi link javaNiceOperator Operator
hi link javaNiceBoolean Boolean
hi link javaNiceType Type

hi! link Conceal Operator
"setlocal conceallevel=2
