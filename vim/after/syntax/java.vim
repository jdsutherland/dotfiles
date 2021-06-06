" if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
"   finish
" endif

if !has('conceal')
    finish
endif


" fold methods: TODO: randomly works
" syn region javaFuncDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\%(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\%([A-Z][$A-Za-z0-9_]*\%(\_s*<\_s*[$A-Za-z0-9,_ <]\+\_s*>\%(\_s*>\)*\_s*\)\?\)\)\_s\+\%([a-zA-Z$0-9_][$A-Za-z0-9_]*\)\_s*(\_[^)]*)\_s*\%(throws\_s\+[A-Z]\k\+\%(\_s*,\_s*[A-Z]\k\+\)*\_s\{-}\)\?\_s*{" end="^\z1}\s*$" keepend transparent fold
" syntax region javaGetterSetter start="\v^\s*public\s\w+\s[sg]et[A-Z]\w+\(.*\)\s\{" end="^\s*}" transparent fold

" syntax match javaNiceOperator "*" conceal cchar=⁕
syntax match javaNiceOperator "==" conceal cchar=≡
syntax match javaNiceOperator "!=" conceal cchar=≠
syntax match javaNiceOperator "<=" conceal cchar=≤
syntax match javaNiceOperator ">=" conceal cchar=≥
syntax match javaNiceOperator "++" conceal cchar=Δ
syntax match javaNiceOperator "--" conceal cchar=∇
syntax match javaNiceOperator "||" conceal cchar=∨
syntax match javaNiceOperator "&&" conceal cchar=∧
syntax match javaNiceOperator "->" conceal cchar=⇾
syntax match javaNiceOperator "\[\]" conceal cchar=□
" syntax match javaNiceOperator "->" conceal cchar=→
syntax match javaNiceOperator "\s\+\zs\.\ze"  conceal cchar=｡

" syntax match javaConcealType "\v\zs[A-Z]\w+\ze\s[_a-z]+" conceal cchar=ℓ
" syntax match javaConcealType "\v(class)@<![ (]\zs[A-Z][<A-Za-z>]+\ze\s[_a-z]+" conceal cchar=ℓ

" syntax match javaConcealType "\v(class)@<![ (]\zs[A-Z][<A-Za-z>]+(\<([A-Za-z ,])+\>)?\ze\s[_a-z]+" conceal cchar=ℓ
" why [ (]


syntax match javaConcealType "\v(class)@<!\zs[A-Z][<A-Za-z>]+(\<([A-Za-z ,])+\>)?\ze\s(extends|implements)@![_A-Za-z]+" conceal cchar=ℓ " types
" doesn't work with highlighting method names
" syntax match javaFuncDef "\v\zs[A-Z][A-Za-z<, >]+\ze\s[_a-zA-Z]+\(" conceal cchar=ℓ " method return types

" syntax match javaFuncDef "\v\s\zs[A-Za-z]\w+\ze\(.*\)\_.*\{"
" syntax match javaHiddenTypeInParens "\v\zs[A-Z][<A-Za-z>]+\s\ze[_a-z]+" conceal

" syntax match javaHideGetter "\vpublic\s\w+\sget[A-Za-z]+\(\)\s\{(\n.*;)+\n\s*\}" conceal
" syntax region javaAccessor start="\vpublic\s\w+\sget[A-Za-z]+\(.*\)\s\{" end="}" fold

" conceal method return types doesn't work with this
syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*\ze(+ end=+\ze(+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses
let java_highlight_functions = 1
let g:java_highlight_all = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

syntax match javaNiceFunction "assert" conceal cchar=✓
" syntax match javaLambdaDef "->" conceal cchar=→
syntax match javaVarArg "\.\.\." conceal cchar=…

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
  syntax keyword javaNiceKeyword var conceal cchar=ℓ
  syntax keyword javaStorageClass final conceal cchar=𝔠
  " syntax keyword javaNiceKeyword public conceal cchar=▶
  syntax keyword javaScopeDecl public conceal cchar=+
  " syntax keyword javaNiceKeyword public conceal cchar=ॱ
  syntax keyword javaScopeDecl private conceal cchar=-
  syntax keyword javaScopeDecl protected conceal cchar=~
  " syntax keyword javaNiceKeyword public conceal cchar=·
  " syntax keyword javaNiceKeyword protected conceal cchar=◈
  " syntax keyword javaNiceKeyword private conceal cchar=-
  syntax keyword javaNiceKeyword return conceal cchar=⇚
  " syntax keyword javaNiceKeyword static conceal cchar=∙
  syntax keyword javaNiceKeyword static conceal cchar=∬
  syntax keyword javaStorageClass static conceal cchar=∬
  syntax keyword javaClassDecl interface conceal cchar=♀

  syntax keyword javaClassDecl extends conceal cchar=<
  syntax keyword javaClassDecl implements conceal cchar=:
  syntax keyword javaMethodDecl throws conceal cchar=‼

  syntax keyword javaTypeDef new conceal cchar=μ
  syntax keyword javaTypeDef this conceal cchar=@
  syntax keyword javaExternal import conceal cchar=ɪ

  syntax keyword javaBoolean true conceal cchar=T
  syntax keyword javaBoolean false conceal cchar=F

  syntax keyword javaType void conceal cchar=∅
  syntax keyword javaType char Character conceal cchar=ċ
  " syntax keyword javaType void conceal cchar=_
  syntax keyword javaType boolean Boolean conceal cchar=ƀ
  syntax keyword javaType String conceal cchar=⟆
  syntax keyword javaType int Integer conceal cchar=ℤ
  syntax keyword javaType float Float double Double conceal cchar=ℝ
  syntax keyword javaType byte Byte conceal cchar=฿
  syntax keyword javaType long Long conceal cchar=ʟ
  syntax keyword javaMethodDecl synchronized conceal cchar=Å
  syntax keyword javaStorageClass synchronized conceal cchar=Å

  syntax match javaHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
  syntax match javaHiddenOperator /^\s*}$/ conceal
  syntax match javaHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
  syntax match javaHiddenOperator /\ *{$/ conceal
  syntax match javaHiddenOperator /;$/ conceal
endif

" " Java: 'new', 'instanceof'
" highlight Operator ctermfg=5  guifg=#d175bc
" " Java: 'this', 'super'
" highlight Typedef ctermfg=5  guifg=#d175bc
" " Java: 'void', 'int', 'double'
" highlight Type ctermfg=4  guifg=#69b7d3
" " literal numbers
" highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d

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
