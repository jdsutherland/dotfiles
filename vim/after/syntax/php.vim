" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_php_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

" Bit-wise operators
syntax match phpNiceOperator "&" conceal cchar=∧ contained containedin=phpRegion
syntax match phpNiceOperator "|" conceal cchar=∨ contained containedin=phpRegion
syntax match phpNiceOperator "\^" conceal cchar=⊻ contained containedin=phpRegion
syntax match phpNiceOperator "\~" conceal cchar=¬ contained containedin=phpRegion
syntax match phpNiceOperator "<<" conceal cchar=≪ contained containedin=phpRegion
syntax match phpNiceOperator ">>" conceal cchar=≫ contained containedin=phpRegion

" Logic operators
syntax match phpNiceOperator "||" conceal cchar=∨ contained containedin=phpRegion
syntax match phpNiceOperator "&&" conceal cchar=∧ contained containedin=phpRegion
syntax match phpNiceOperator "xor" conceal cchar=⊻ contained containedin=phpRegion
syntax match phpNiceOperator "<=" conceal cchar=≤ contained containedin=phpRegion
syntax match phpNiceOperator ">=" conceal cchar=≥ contained containedin=phpRegion
syntax match phpNiceOperator "==" conceal cchar=≈ contained containedin=phpRegion
syntax match phpNiceOperator "===" conceal cchar=≣ contained containedin=phpRegion
syntax match phpNiceOperator "::" conceal cchar=∷ contained containedin=phpRegion
syntax match phpNiceOperator "!=" conceal cchar=≠ contained containedin=phpRegion
syntax match phpNiceOperator "!==" conceal cchar=≢ contained containedin=phpRegion
syntax match phpNiceRelation "=>" conceal cchar=⇛ contained containedin=phpRegion
syntax match phpNiceRelation "++" conceal cchar=∆ contained containedin=phpRegion
syntax match phpNiceMemberSelector "\->" conceal cchar=→ contained containedin=phpRegion

" Functions / keywords
syntax keyword phpNiceOperator array_sum conceal cchar=∑ contained containedin=phpRegion
syntax keyword phpNiceKeyword sqrt conceal cchar=√ contained containedin=phpRegion
syntax keyword phpNiceKeyword M_PI conceal cchar=π contained containedin=phpRegion
syntax keyword phpNiceKeyword function conceal cchar=ƒ contained containedin=phpRegion

hi link phpNiceOperator phpOperator
hi link phpNiceStatement phpStatement
hi link phpNiceKeyword phpKeyword
hi link phpNiceRelation phpRelation
hi link phpNiceMemberSelector phpMemberSelector
hi! link Conceal phpOperator

"setlocal conceallevel=2
