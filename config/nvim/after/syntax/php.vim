" " we need the conceal feature (vim ≥ 7.3)
" if exists('g:no_php_conceal') || !has('conceal') || &enc != 'utf-8'
"     finish
" endif


" syntax keyword phpStructure extends conceal cchar=<
" syntax keyword phpStructure implements conceal cchar=←

" " Bit-wise operators
" syntax match phpNiceOperator "&" conceal cchar=∧ contained containedin=phpRegion
" syntax match phpNiceOperator "|" conceal cchar=∨ contained containedin=phpRegion
" syntax match phpNiceOperator "\^" conceal cchar=⊻ contained containedin=phpRegion
" syntax match phpNiceOperator "\~" conceal cchar=¬ contained containedin=phpRegion
" syntax match phpNiceOperator "<<" conceal cchar=≪ contained containedin=phpRegion
" syntax match phpNiceOperator ">>" conceal cchar=≫ contained containedin=phpRegion

" " Logic operators
" syntax match phpNiceOperator "||" conceal cchar=∨ contained containedin=phpRegion
" syntax match phpNiceOperator "&&" conceal cchar=∧ contained containedin=phpRegion
" syntax match phpNiceOperator "xor" conceal cchar=⊻ contained containedin=phpRegion
" syntax match phpNiceOperator "<=" conceal cchar=≤ contained containedin=phpRegion
" syntax match phpNiceOperator ">=" conceal cchar=≥ contained containedin=phpRegion
" syntax match phpNiceOperator "==" conceal cchar=≈ contained containedin=phpRegion
" syntax match phpNiceOperator "===" conceal cchar=≣ contained containedin=phpRegion
" syntax match phpNiceOperator "!=" conceal cchar=≠ contained containedin=phpRegion
" syntax match phpNiceOperator "!==" conceal cchar=≢ contained containedin=phpRegion
" syntax match phpNiceRelation "=>" conceal cchar=⇛ contained containedin=phpRegion
" syntax match phpNiceRelation "++" conceal cchar=∆ contained containedin=phpRegion
" " syntax match phpNiceOperator "::" conceal cchar=∷ contained containedin=phpRegion
" " syntax match phpNiceMemberSelector "\->" conceal cchar=→ contained containedin=phpRegion
" syntax match phpNiceMemberSelector "\->" conceal cchar=. contained containedin=phpRegion

" " Functions / keywords
" syntax keyword phpNiceOperator array_sum conceal cchar=∑ contained containedin=phpRegion
" syntax keyword phpNiceKeyword sqrt conceal cchar=√ contained containedin=phpRegion
" syntax keyword phpNiceKeyword M_PI conceal cchar=π contained containedin=phpRegion
" syntax keyword phpNiceKeyword function conceal cchar=ƒ contained containedin=phpRegion
" syntax keyword phpBoolean conceal cchar=T
" syntax keyword phpBoolean conceal cchar=F

" syntax keyword phpStructure null conceal cchar=∅
" syntax keyword phpType NULL conceal cchar=∅
" syntax keyword phpStructure new conceal cchar=μ
" syntax match phpStructure "\$this" conceal cchar=@
" syntax keyword phpStructure self contained conceal cchar=@
" syntax keyword phpStatement return conceal cchar=⇚

" " syntax keyword phpRepeat foreach conceal cchar=∫

" syntax keyword phpRepeat define conceal cchar=𝔠
" syntax keyword phpKeyword const conceal cchar=𝔠
" " syntax keyword phpStorageClass public conceal cchar=∙
" syntax keyword phpStorageClass public conceal
" syntax keyword phpStorageClass protected conceal cchar=◈
" syntax keyword phpStorageClass private conceal cchar=○
" syntax keyword phpStorageClass static conceal cchar=∙
" syntax keyword phpNiceKeyword import conceal cchar=ɪ

" syntax keyword phpType list conceal cchar=▤
" syntax keyword phpType array conceal cchar=▤
" " syntax keyword phpType function conceal cchar=ƒ

" " syntax keyword phpType public conceal cchar=+
" " syntax keyword phpType private conceal cchar=×
" " syntax keyword phpType protected conceal cchar=-

" syntax keyword phpNiceKeyword break conceal cchar=↯
" syntax keyword phpNiceKeyword continue conceal cchar=↰

" " distinguish lines beginning with method chains
" syntax match phpStatement "\s\+\zs\->\ze"  conceal cchar=｡

" syntax match phpVarSelector "\$"  contained display conceal
" syntax match phpStatement /;$/ conceal
" " syntax match phpStatement /\S\zs()\ze\(\S\| [^{]\)/ conceal
" syntax match phpStatement /^\s*}$/ conceal
" syntax match phpStatement /\(^\s*\)\@<=}\s*/ conceal
" syntax match phpStatement /\ *{$/ conceal
" " syntax match phpStatement /;$/ conceal

" hi link phpNiceOperator phpOperator
" hi link phpNiceStatement phpStatement
" hi link phpNiceKeyword phpKeyword
" hi link phpNiceRelation phpRelation
" hi link phpNiceMemberSelector phpMemberSelector
" hi! link Conceal phpOperator

" hi! Conceal ctermbg=Black ctermfg=Magenta

" "setlocal conceallevel=2
