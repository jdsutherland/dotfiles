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
" syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=!
syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
syntax match pyNiceOperator "<=" conceal cchar=≤
syntax match pyNiceOperator ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match pyNiceOperator "!=" conceal cchar=≢

syntax keyword pythonBuiltin sum conceal cchar=∑
syntax keyword pythonBuiltin all conceal cchar=∀
syntax keyword pythonBuiltin any conceal cchar=∃
syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π
syntax match pyNiceOperator "\<\%(math\.\|\)ceil\ze\>(" conceal cchar=⌈
syntax match pyNiceOperator "\<\%(math\.\|\)floor\ze\>(" conceal cchar=⌊

" syntax match pyNiceOperator "\"\"\"" conceal cchar=‴
syntax match pyNiceOperator "\.\.\." conceal cchar=…

syntax keyword pythonBuiltin int conceal cchar=ℤ
syntax keyword pythonBuiltin float conceal cchar=ℝ
syntax keyword pythonBuiltin bool conceal cchar=ƀ
syntax keyword pythonBuiltin complex conceal cchar=ℂ
syntax keyword pythonBuiltin str conceal cchar=⟆

" syntax match pyNiceOperator " \* " conceal cchar=∙
" syntax match pyNiceOperator " \zs/\ze " conceal cchar=÷
" syntax match pyNiceOperator " \zs\*\ze " conceal cchar=⨉
" syntax match pyNiceOperator " \zs\/\ze "  conceal cchar=÷
" syntax match pyNiceOperator "\w\?\s+\zs\*\zs\w+" conceal cchar=⁕
" The following are special cases where it /may/ be okay to ignore PEP8
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ

" Your background, and taste, may affect whether you like # for cardinality ;)
syntax keyword pythonBuiltin len conceal cchar=#
syntax keyword pythonBuiltin del conceal cchar=✗
syntax keyword pythonBuiltin break conceal cchar=↯

" TODO
syntax keyword pythonBuiltin True conceal cchar=✓
syntax keyword pythonBuiltin False conceal cchar=✗
syntax keyword pythonInclude import conceal cchar=ɪ
syntax keyword pythonInclude from conceal cchar=ｆ
syntax keyword pythonStatement return conceal cchar=⇚

syntax match pythonFunction "\.append()\|.append" conceal cchar=«
syntax match pythonFunction "\.pop()" conceal cchar=»
" syntax match pythonImport "\<re\>" conceal cchar=ʀ
" syntax match pyNiceStatement "__" conceal cchar=＿ FIXME: ya

syntax keyword pyNiceStatement lambda conceal cchar=λ
syntax match pyNiceStatement "->" conceal cchar=→
syntax match pythonStatement "assert" conceal cchar=✓
syntax keyword pythonStatement assert conceal cchar=✓
syntax keyword pythonBuiltin None conceal cchar=∅
syntax keyword pythonBuiltin inf conceal cchar=∞
" syntax keyword pythonBuiltin tuple conceal cchar=☐
syntax keyword pythonBuiltin tuple conceal cchar=ƭ
syntax keyword pythonBuiltin self conceal cchar=@

syntax keyword pythonBuiltinFunc super conceal cchar=Ω
syntax match pythonDecorator "@staticmethod" conceal cchar=∬
syntax match pythonDecorator "@classmethod" conceal cchar=Ɱ
syntax match pythonDecorator "@property" conceal cchar=¶
" syntax match pyNiceOperator "\v\w+\zs\:\ze" conceal cchar=꞉
syntax match pyNiceOperator "\v\zs:\ze\s+\S+" conceal cchar=⁝
" syntax match pyNiceOperator "\v\zs:\ze\s+\S+" conceal cchar=⇒

hi link pyNiceOperator Operator
hi link pyNiceStatement Statement
hi link pyNiceKeyword Keyword
hi link pyNiceBuiltin Builtin
hi! Conceal ctermbg=Black ctermfg=LightRed

"setlocal conceallevel=1
