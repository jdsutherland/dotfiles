" based on https://github.com/ehamberg/vim-cute-python

" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
syntax clear pythonOperator

syntax match pythonOperator "\<is\>"

syntax match pythonOperator "\<in\>" conceal cchar=∈
syntax match pythonOperator "\<or\>" conceal cchar=∨
syntax match pythonOperator "\<and\>" conceal cchar=∧
" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
syntax match pyNiceOperator "<=" conceal cchar=≤
syntax match pyNiceOperator ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match pyNiceOperator "!=" conceal cchar=≢

syntax keyword pyNiceOperator sum conceal cchar=∑
syntax keyword pyNiceBuiltin all conceal cchar=∀
syntax keyword pyNiceBuiltin any conceal cchar=∃
syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π
syntax match pyNiceOperator "\<\%(math\.\|\)ceil\>" conceal cchar=⌈
syntax match pyNiceOperator "\<\%(math\.\|\)floor\>" conceal cchar=⌊

syntax keyword pythonBuiltinObj int conceal cchar=ℤ
syntax keyword pythonBuiltinObj float conceal cchar=ℝ
syntax keyword pythonBuiltinObj complex conceal cchar=ℂ
" syntax keyword pythonBuiltinObj str conceal cchar=Ｓ

" syntax match pyNiceOperator " \* " conceal cchar=∙
syntax match pyNiceOperator " / " conceal cchar=÷
" The following are special cases where it /may/ be okay to ignore PEP8
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ

" Your background, and taste, may affect whether you like # for cardinality ;)
syntax keyword pyNiceBuiltin len conceal cchar=#
syntax keyword pythonClassVar self conceal cchar=@
syntax keyword pyNiceStatement return conceal cchar=⇚

syntax keyword pythonBoolean True conceal cchar=T
syntax keyword pythonBoolean False conceal cchar=F
syntax keyword pythonImport import conceal cchar=ɪ
syntax keyword pythonImport from conceal cchar=ｆ

syntax match pythonFunction "\.push" conceal cchar=«
syntax match pythonFunction "\.pop()\|\.pop" conceal cchar=»

syntax keyword pyNiceStatement lambda conceal cchar=λ
syntax match pyNiceStatement "->" conceal cchar=→
syntax keyword pyNiceStatement None conceal cchar=∅

syntax keyword pythonBuiltinFunc super conceal cchar=Ω
syntax match pythonDecorator "@staticmethod" conceal cchar=∬
syntax match pythonDecorator "@property" conceal cchar=¶

hi link pyNiceOperator Operator
hi link pyNiceStatement Statement
hi link pyNiceKeyword Keyword
hi link pyNiceBuiltin Builtin
hi! Conceal ctermbg=Black ctermfg=Magenta

"setlocal conceallevel=1
