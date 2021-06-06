if !has('conceal')
    finish
endif

setlocal conceallevel=1
syntax clear rustOperator

syntax match rustOperator "=\@<!===\@!" conceal cchar=≖
syntax match rustOperator "!=" conceal cchar=≠
syntax match rustOperator "<=" conceal cchar=≤
syntax match rustOperator ">=" conceal cchar=≥

" syntax match rustOperator "<<" conceal cchar=«
" syntax match rustOperator ">>" conceal cchar=»

syntax match rustModPathSep "::" conceal cchar=ː

syntax match rustOperator "->" conceal cchar=→
syntax match rustOperator "=>" conceal cchar=⇒

syntax match rustOperator "||" conceal cchar=∥

syntax keyword rustTrait bool conceal cchar=ƀ
syntax keyword rustTrait u8 usize isize conceal cchar=฿
syntax keyword rustTrait char conceal cchar=ʀ
syntax keyword rustTrait str String conceal cchar=⟆
syntax keyword rustTrait f32 f64 conceal cchar=ℝ
syntax keyword rustTrait i16 i32 conceal cchar=ⅰ
syntax keyword rustTrait i64 i128 conceal cchar=ⅱ
syntax keyword rustTrait u16 u32 conceal cchar=Ⅰ
syntax keyword rustTrait u64 u128 conceal cchar=Ⅱ
" syntax keyword rustTrait error conceal cchar=ɇ
" syntax keyword rustTrait int conceal cchar=ℤ
" syntax keyword rustTrait complex64 conceal cchar=ℂ
" syntax keyword rustTrait complex128 conceal cchar=ℂ

" syntax keyword rustStructure enum conceal cchar=∈
syntax keyword rustStructure struct conceal cchar=⊇
syntax keyword rustKeyword impl conceal cchar=𝓲
" syntax keyword rustKeyword fn conceal cchar=ƒ
syntax keyword rustSuper super conceal cchar=Ω
syntax keyword rustKeyword pub conceal cchar=+
syntax keyword rustKeyword let conceal cchar=ℓ
syntax keyword rustKeyword return conceal cchar=⇚
syntax keyword rustKeyword continue conceal cchar=↰
syntax keyword rustType i32 conceal cchar=ℤ
syntax keyword rustSelf self conceal cchar=@
" syntax keyword rustStorage mut conceal cchar=☐
syntax keyword rustStorage mut conceal cchar=⚕

syntax match rustAssert "\v<assert_?" conceal cchar=✓
syntax match myRust "^\s*\zs\.\ze" conceal cchar=｡

syntax keyword rustBoolean true conceal cchar=T
syntax keyword rustBoolean false conceal cchar=F

syntax match rustOperator /;$/ conceal
syntax match rustOperator /^\s*\zs}\ze$/ conceal
syntax match rustOperator /\(^\s*\)\@<=\zs}\ze\s*/ conceal
syntax match rustOperator /\ *\zs{\ze$/ conceal

hi! link rustOperator Operator
hi! link Conceal Operator

hi! Conceal ctermbg=Black ctermfg=LightRed
