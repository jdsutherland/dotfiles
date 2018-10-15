if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match javaNiceOperator "*" conceal cchar=⁕
syntax match goNiceOperator "==" conceal cchar=≡
syntax match csEnclosed "\[\]" conceal cchar=⌑
syntax match javaNiceOperator "!=" conceal cchar=≠
syntax match javaNiceOperator "<=" conceal cchar=≤
syntax match javaNiceOperator ">=" conceal cchar=≥
syntax match javaNiceOperator "++" conceal cchar=Δ
syntax match javaNiceOperator "--" conceal cchar=∇
syntax match javaNiceOperator "||" conceal cchar=⋁
syntax match javaNiceOperator "&&" conceal cchar=⋀
syntax match javaNiceOperator "->" conceal cchar=⇾
" syntax match javaNiceOperator "->" conceal cchar=→
syntax match javaNiceOperator "\s\+\zs\.\ze"  conceal cchar=｡

syntax match javaNiceFunction "assertEquals" conceal cchar=≡

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
  syntax keyword javaNiceKeyword public conceal cchar=ॱ
  syntax keyword javaNiceKeyword protected conceal cchar=ॱ
  syntax keyword javaNiceKeyword private conceal cchar=·
  " syntax keyword javaNiceKeyword public conceal cchar=·
  " syntax keyword javaNiceKeyword protected conceal cchar=◈
  " syntax keyword javaNiceKeyword private conceal cchar=-
  syntax keyword javaNiceKeyword return conceal cchar=⇚
  " syntax keyword javaNiceKeyword static conceal cchar=∙
  syntax keyword javaNiceKeyword static conceal cchar=∬
  " syntax keyword javaNiceKeyword virtual conceal
  " syntax keyword javaNiceKeyword abstract conceal
  syntax match csType "\v<var " conceal cchar=@

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
  " syntax match goVar "\v<var " conceal cchar=@

  syntax keyword javaClassDecl extends conceal cchar=<
  syntax keyword javaClassDecl implements conceal cchar=:

  syntax keyword csNewDecleration new conceal cchar=μ
  syntax keyword csUnspecifiedStatement this conceal cchar=@
  syntax keyword javaExternal using conceal cchar=ɪ

  syntax keyword javaBoolean true conceal cchar=T
  syntax keyword javaBoolean false conceal cchar=F

  syntax keyword csType void conceal cchar=∅
  syntax keyword csType decimal conceal cchar=$
  syntax keyword csType char conceal cchar=ċ
  syntax keyword csType bool conceal cchar=ƀ
  syntax keyword csType string conceal cchar=⟆
  syntax keyword csType int conceal cchar=ℤ
  syntax keyword csType float double conceal cchar=ℝ
  syntax keyword csType byte conceal cchar=฿
  syntax keyword csType long conceal cchar=ʟ

  " syntax match javaHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
  " syntax match javaHiddenOperator /^\s*}$/ conceal
  " syntax match javaHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
  " syntax match javaHiddenOperator /\ *{$/ conceal
  syntax match javaHiddenOperator /;$/ conceal
endif

" Java: 'new', 'instanceof'
highlight Operator ctermfg=5  guifg=#d175bc
" Java: 'this', 'super'
highlight Typedef ctermfg=5  guifg=#d175bc
" Java: 'void', 'int', 'double'
highlight Type ctermfg=4  guifg=#69b7d3
" literal numbers
highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d

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
