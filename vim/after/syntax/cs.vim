if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif


" syntax match javaNiceOperator "*" conceal cchar=⁕
syntax match csEnclosed "==" conceal cchar=≡
syntax match csEnclosed "\[\]" conceal cchar=⌑
syntax match javaNiceOperator "!=" conceal cchar=≠
syntax match javaNiceOperator "<=" conceal cchar=≤
syntax match javaNiceOperator ">=" conceal cchar=≥
syntax match javaNiceOperator "++" conceal cchar=Δ
syntax match javaNiceOperator "--" conceal cchar=∇
syntax match javaNiceOperator "||" conceal cchar=∨
syntax match javaNiceOperator "&&" conceal cchar=∧
syntax match javaNiceOperator "->" conceal cchar=⇾
syntax match javaNiceOperator "=>" conceal cchar=⇒
syntax keyword javaNiceOperator interface conceal cchar=♀
syntax match pythonStatement "Assert" conceal cchar=✓
" syntax match javaNiceOperator "->" conceal cchar=→
syntax match javaNiceOperator "^\s*\zs\.\ze"  conceal cchar=｡

syntax match javaNiceFunction "assertEquals" conceal cchar=≡

" syntax match javaHiddenType "\v\zs[A-Z]\w+\s\ze[_a-z]+" conceal
" syntax match javaHiddenType "\v\zs[A-Z][<A-Za-z>]+\ze\s[_a-z]+" conceal cchar=ℓ
" syntax match javaConcealType "\v(class)@<![ (]\zs[A-Z][<A-Za-z>]+\ze\s[_a-z]+" conceal cchar=ℓ " types
syntax match javaConcealType "\v(class)@<![ (]\zs[A-Z][<A-Za-z>]+\ze\s[_a-zA-Z<>]+" conceal cchar=ℓ " types
syntax match javaConcealType "\v\zs[A-Z][<>A-Za-z]+\ze\s[A-Z][A-Za-z]+.*\{\s(get|set)" conceal cchar=ℓ " types (props)
syntax match javaConcealType "\v\zs[A-Z][A-Za-z<, >]+\ze\s[_a-zA-Z]+\(" conceal cchar=ℓ " method return types

syntax keyword csAsync async conceal cchar=ÅⱣ
syntax keyword csAsync await conceal cchar=å

" syntax match csFuncDef "\v\s\zs[A-Z]\w+\ze\(.*\)$"
" syntax match csFuncDef "\v\s\zs[A-Z]\w+\ze\(\_.*\)$"
syntax match csFuncDef "\v\s\zs[A-Za-z]\w+\ze\(.*\)\_.\s*\{"
syntax match csFuncDef "\v\s\zs[A-Za-z]\w+\ze\(.*\)\s+\=\>" " fat arrow

" TODO: keep both?
syntax match csFuncDef "\v\s\zs[A-Za-z]\w+\ze\(\n" " multiline defs
" TODO: doesn't highlight  `Handler<TEvent>` in `private IEventHandler<TEvent> Handler<TEvent>(CommerceContext context)` even though the search matches
syntax match csFuncDef "\v(public|private|protected|internal).*\s\zs[A-Z][A-Za-z<, >]+\ze\(\n" " multiline defs
hi def link csFuncDef Function

let s:extraConceal = 1
if s:extraConceal
  syntax keyword csConstant null conceal cchar=∅
  syntax keyword javaNiceKeyword break conceal cchar=↯
  " syntax keyword javaNiceKeyword continue conceal cchar=↟
  " syntax keyword javaNiceKeyword else conceal cchar=⦂
  " syntax keyword javaNiceKeyword case conceal cchar=↳
  " syntax keyword javaNiceKeyword class conceal cchar=₡
  " syntax keyword javaNiceKeyword const conceal cchar=𝔠
  syntax keyword javaNiceKeyword const conceal cchar=𝔠
  syntax keyword javaNiceKeyword readonly conceal cchar=𝔠
  syntax keyword javaNiceKeyword public conceal cchar=+
  syntax keyword javaNiceKeyword protected conceal cchar=|
  syntax keyword javaNiceKeyword private conceal cchar=-
  syntax keyword javaNiceKeyword internal conceal cchar=&
  syntax keyword javaNiceKeyword delegate conceal cchar=ƒ
  syntax keyword javaNiceKeyword virtual conceal cchar=ṿ
  syntax keyword javaNiceKeyword override conceal cchar=ọ
  syntax keyword javaNiceKeyword abstract conceal cchar=ā
  " syntax keyword javaNiceKeyword public conceal cchar=·
  " syntax keyword javaNiceKeyword protected conceal cchar=◈
  " syntax keyword javaNiceKeyword private conceal cchar=-
  syntax keyword csRepeat return conceal cchar=⇚
  " syntax keyword javaNiceKeyword static conceal cchar=∙
  syntax keyword javaNiceKeyword static conceal cchar=∬
  " syntax keyword javaNiceKeyword virtual conceal
  " syntax keyword javaNiceKeyword abstract conceal

  " syntax keyword javaNiceKeyword break conceal cchar=↯
  " " syntax keyword javaNiceKeyword continue conceal cchar=↟
  " " syntax keyword javaNiceKeyword else conceal cchar=⦂
  " " syntax keyword javaNiceKeyword case conceal cchar=↳
  " " syntax keyword javaNiceKeyword class conceal cchar=₡
  " " syntax keyword javaNiceKeyword const conceal cchar=𝔠
  " syntax keyword javaNiceKeyword final conceal cchar=𝔠
  " " syntax keyword javaNiceKeyword public conceal cchar=▶
  " " syntax keyword javaNiceKeyword public conceal cchar=+
  " syntax keyword javaNiceKeyword public conceal cchar=·
  " syntax keyword javaNiceKeyword protected conceal cchar=◈
  " syntax keyword javaNiceKeyword private conceal cchar=-
  " syntax keyword javaNiceKeyword return conceal cchar=⇚
  " syntax keyword javaNiceKeyword static conceal cchar=∙
  " syntax keyword javaNiceKeyword virtual conceal cchar=ⅵ
  syntax keyword csType var conceal cchar=ℓ

  syntax keyword javaClassDecl extends conceal cchar=<
  syntax keyword javaClassDecl implements conceal cchar=:

  syntax keyword csNewDecleration new conceal cchar=μ
  syntax keyword csUnspecifiedStatement this conceal cchar=@
  " syntax keyword javaExternal using conceal cchar=ɪ

  syntax keyword csConstant true conceal cchar=T
  syntax keyword csConstant false conceal cchar=F

  syntax keyword csType void conceal cchar=∅
  syntax keyword csType decimal conceal cchar=$
  syntax keyword csType char conceal cchar=ċ
  syntax keyword csType bool conceal cchar=ƀ
  syntax keyword csType string conceal cchar=⟆
  syntax keyword csType int conceal cchar=ℤ
  syntax keyword csType float double conceal cchar=ℝ
  syntax keyword csType byte conceal cchar=฿
  syntax keyword csType long conceal cchar=ʟ
  syntax keyword csType object conceal cchar=ɵ

  " hide no arg method() parens
  syntax match javaHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal

  " trailing }
  syntax match javaHiddenOperator /^\s*}$/ conceal
  syntax match javaHiddenOperator /\(^\s*\)\@<=}\s*/ conceal

  " beginning {
  syntax match javaHiddenOperator /\ *{$/ conceal

  " trailing ;
  syntax match javaHiddenOperator /;$/ conceal
endif

hi link javaNiceConstant Constant
hi link javaNiceKeyword Keyword
hi link javaNiceOperator Operator
hi link javaNiceBoolean Boolean
hi link javaNiceType Type

hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=Magenta

" set expandtab ts=4 sw=4 ai
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
"setlocal conceallevel=2
