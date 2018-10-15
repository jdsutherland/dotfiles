" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

syntax match cNiceOperator "++" conceal cchar=Δ
syntax match cNiceOperator "--" conceal cchar=∇

syntax match cNiceOperator "==" conceal cchar=≡
syntax match cNiceOperator "!=" conceal cchar=≠
syntax match cNiceOperator ">=" conceal cchar=≥
syntax match cNiceOperator "<=" conceal cchar=≤
syntax match cNiceOperator "[a-zA-Z]\s\zs\*\ze\s\%[a-zA-Z]" conceal cchar=⁕
syntax match cNiceOperator " \zs\*\ze" conceal cchar=⁕
syntax match cNiceOperator "\zs&\ze\w\+" conceal cchar=&
" syntax match cNiceOperator " \zs\*\ze " conceal cchar=⨉
" syntax match cNiceOperator " \zs\/\ze "  conceal cchar=÷

syntax match cNiceOperator "&&" conceal cchar=∧
syntax match cNiceOperator "||" conceal cchar=∨

" syntax match cNiceOperator "<<" conceal cchar=≺
" syntax match cNiceOperator ">>" conceal cchar=≻

syntax match cNiceOperator "->" conceal cchar=→

syntax keyword cStructure typedef conceal cchar=₪
syntax keyword cStructure enum conceal cchar=∈
syntax keyword cStructure union conceal cchar=⋃
syntax keyword cStructure struct conceal cchar=⊇
syntax keyword cOperator sizeof conceal cchar=#

" syntax match cStatement "#include" conceal cchar=ɪ
syntax keyword cStatement return conceal cchar=⇚
syntax keyword cStatement break conceal cchar=↯
syntax keyword cStatement continue conceal cchar=↰
syntax keyword cStatement goto conceal cchar=↷

syntax keyword cType NULL conceal cchar=∅
syntax keyword cType const conceal cchar=𝔠
syntax keyword cType extern conceal cchar=Ǝ
syntax keyword cType void conceal cchar=∅
syntax keyword cType static conceal cchar=∙
syntax keyword cType unsigned conceal cchar=ù

syntax keyword cType int short char conceal cchar=ℤ
syntax keyword cType byte uint8 uint8_t uint16 uint16_t uint32 uint32_t size_t conceal cchar=฿
syntax keyword cType char conceal cchar=ċ
syntax keyword cType string conceal cchar=⟆
syntax keyword cType bool conceal cchar=ƀ
syntax keyword cType float double conceal cchar=ℝ
syntax keyword cType long conceal cchar=ʟ
syntax keyword cType signed conceal cchar=±

syntax keyword cNiceBoolean true conceal cchar=T
syntax keyword cNiceBoolean false conceal cchar=F

" syntax match cppHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
" syntax match cHiddenOperator /^\s*}$/ conceal
" syntax match cHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
" syntax match cHiddenOperator /\ *{$/ conceal
syntax match cHiddenOperator /;$/ conceal

hi link cNiceOperator Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightRed
" hi! Conceal ctermbg=Black ctermfg=LightRed

" set conceallevel=2
