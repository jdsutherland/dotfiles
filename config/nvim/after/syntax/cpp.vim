" if exists('g:no_cpp_conceal') || !has('conceal') || &enc != 'utf-8'
"   finish
" endif

" syntax keyword cppType int32 uint32 int64 uint64

" " syntax match cNiceOperator "\w+\s\zs\*\ze\s\w+" conceal cchar=⁕
" " syntax match cppNiceOperator " \zs\*\ze" conceal cchar=⁕
" syntax match cppNiceOperator "&" conceal cchar=&
" syntax match cppNiceOperator "==" conceal cchar=≡
" syntax match cppNiceOperator "!=" conceal cchar=≠
" syntax match cppNiceOperator "<=" conceal cchar=≤
" syntax match cppNiceOperator ">=" conceal cchar=≥
" syntax match cppNiceOperator "++" conceal cchar=Δ
" syntax match cppNiceOperator "--" conceal cchar=∇
" syntax match cppNiceOperator "||" conceal cchar=⋁
" syntax match cppNiceOperator "&&" conceal cchar=⋀
" syntax match cppNiceOperator "<<" conceal cchar=≪
" syntax match cppNiceOperator ">>" conceal cchar=≫
" " syntax match cppNiceOperator "\:\:" conceal cchar=∷
" syntax match cppNiceOperator "->" conceal cchar=→
" " syntax match cppNiceOperator " \zs\*\ze " conceal cchar=⨉

" syntax match cppNiceFunction "EXPECT_TRUE" conceal cchar=Ƭ
" syntax match cppNiceFunction "EXPECT_FALSE" conceal cchar=ƒ
" syntax match cppNiceFunction "EXPECT_EQ" conceal cchar=≟
" syntax match cppNiceFunction "ASSERT_EQ" conceal cchar=≡

" let s:extraConceal = 1
" if s:extraConceal
"   syntax keyword cppNiceConstant nullptr conceal cchar=⦳
"   syntax keyword cppNiceConstant NULL conceal cchar=∅

"   syntax keyword cppNiceKeyword auto conceal cchar=⍺
"   syntax keyword cppNiceKeyword break conceal cchar=↯
"   " syntax keyword cppNiceKeyword case conceal cchar=↳
"   " syntax keyword cppNiceKeyword class conceal cchar=₡
"   syntax keyword cppNiceKeyword const conceal cchar=𝔠
"   syntax keyword cppNiceKeyword continue conceal cchar=↟
"   " syntax keyword cppNiceKeyword else conceal cchar=⦂
"   syntax keyword cppNiceKeyword explicit conceal cchar=⍷
"   " syntax keyword cppNiceKeyword for conceal cchar=∀
"   " syntax keyword cppNiceKeyword if conceal cchar=⁇
"   syntax keyword cppNiceKeyword override conceal cchar=⎆
"   syntax keyword cppNiceKeyword public conceal cchar=+
"   syntax keyword cppNiceKeyword protected conceal cchar=◈
"   syntax keyword cppNiceKeyword private conceal cchar=-
"   syntax keyword cppNiceKeyword return conceal cchar=⇚
"   syntax keyword cppNiceKeyword sizeof conceal cchar=#
" 	syntax keyword cppNiceKeyword enum conceal cchar=∈
" 	syntax keyword cppNiceKeyword union conceal cchar=⋃
" 	syntax keyword cppNiceKeyword struct conceal cchar=⊇
"   syntax keyword cppNiceKeyword static conceal cchar=∙
"   " syntax keyword cppNiceKeyword switch conceal cchar=⋔
"   syntax keyword cppNiceKeyword virtual conceal cchar=ⅵ

"   syntax keyword cppNiceBoolean true conceal cchar=✓
"   syntax keyword cppNiceBoolean false conceal cchar=✗

"   " syntax keyword cppNiceType void conceal cchar=∅
"   " syntax keyword cppNiceType bool conceal cchar=☯
"   " syntax keyword cppNiceType char conceal cchar=ⅽ
"   " syntax keyword cppNiceType string conceal cchar=⟆
"   " syntax keyword cppNiceType int conceal cchar=ⅰ
"   " syntax keyword cppNiceType int32 conceal cchar=ⅰ
"   " syntax keyword cppNiceType int64 conceal cchar=ⅱ
"   " syntax keyword cppNiceType uint32 conceal cchar=Ⅰ
"   " syntax keyword cppNiceType uint64 conceal cchar=Ⅱ
"   syntax keyword cppNiceType void conceal cchar=∅
"   syntax keyword cppNiceType bool conceal cchar=ƀ
"   syntax keyword cppNiceType string conceal cchar=⟆
"   syntax keyword cppNiceType int conceal cchar=ℤ
"   syntax keyword cppNiceType int32 conceal cchar=ⅰ
"   syntax keyword cppNiceType int64 conceal cchar=ⅱ
"   syntax keyword cppNiceType uint32 conceal cchar=Ⅰ
"   syntax keyword cppNiceType uint64 conceal cchar=Ⅱ


"   " syntax match cppHiddenOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
"   " syntax match cppHiddenOperator /^\s*}$/ conceal
"   " syntax match cppHiddenOperator /\(^\s*\)\@<=}\s*/ conceal
"   " syntax match cppHiddenOperator /\ *{$/ conceal
"   syntax match cppHiddenOperator /;$/ conceal
" endif

" hi link cppNiceBoolean Boolean
" hi link cppNiceConstant Constant
" hi link cppNiceFunction Function
" hi link cppNiceKeyword Keyword
" hi link cppNiceOperator Operator
" hi link cppNiceType Type

" hi! link Conceal Operator
" " hi! Conceal ctermbg=Black ctermfg=LightRed
" hi! Conceal ctermbg=Black ctermfg=LightRed
" "setlocal conceallevel=2
