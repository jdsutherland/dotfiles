if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match javaNiceOperator "*" conceal cchar=⁕
syntax match javaNiceOperator "==" conceal cchar=≟
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
  syntax keyword javaNiceConstant null conceal cchar=∅

  syntax keyword javaNiceKeyword break conceal cchar=↯
  " syntax keyword javaNiceKeyword continue conceal cchar=↟
  " syntax keyword javaNiceKeyword else conceal cchar=⦂
  " syntax keyword javaNiceKeyword case conceal cchar=↳
  " syntax keyword javaNiceKeyword class conceal cchar=₡
  " syntax keyword javaNiceKeyword const conceal cchar=𝔠
  syntax keyword javaNiceKeyword final conceal cchar=𝔠
  " syntax keyword javaNiceKeyword public conceal cchar=▶
  " syntax keyword javaNiceKeyword public conceal cchar=+
  " syntax keyword javaNiceKeyword public conceal cchar=ॱ
  syntax match javaScopeDecl /\v<public\s/ conceal
  syntax keyword javaNiceKeyword protected conceal cchar=ॱ
  syntax keyword javaNiceKeyword private conceal cchar=-
  " syntax keyword javaNiceKeyword public conceal cchar=·
  " syntax keyword javaNiceKeyword protected conceal cchar=◈
  " syntax keyword javaNiceKeyword private conceal cchar=-
  syntax keyword javaNiceKeyword return conceal cchar=⇚
  " syntax keyword javaNiceKeyword static conceal cchar=∙
  syntax keyword javaNiceKeyword static conceal cchar=∬

  syntax keyword javaClassDecl extends conceal cchar=<
  syntax keyword javaClassDecl implements conceal cchar=:

  syntax keyword javaTypeDef new conceal cchar=μ
  syntax keyword javaTypeDef this conceal cchar=@
  syntax keyword javaExternal import conceal cchar=ɪ

  syntax keyword javaBoolean true conceal cchar=T
  syntax keyword javaBoolean false conceal cchar=F

  syntax keyword javaType void conceal cchar=∅
  syntax keyword javaType char conceal cchar=ċ
  " syntax keyword javaType void conceal cchar=_
  syntax keyword javaType boolean conceal cchar=ƀ
  syntax keyword javaType String conceal cchar=⟆
  syntax keyword javaType int conceal cchar=ℤ
  syntax keyword javaType float double conceal cchar=ℝ
  syntax keyword javaType byte conceal cchar=฿
  syntax keyword javaType long conceal cchar=ʟ
  syntax keyword javaMethodDecl synchronized conceal cchar=☯

  syntax match javaHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
  syntax match javaHiddenOperator /^\s*}$/ conceal
  syntax match javaHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
  syntax match javaHiddenOperator /\ *{$/ conceal
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
hi link cJavaNiceKeyword StorageClass
hi link javaNiceConstant javaConstant

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
