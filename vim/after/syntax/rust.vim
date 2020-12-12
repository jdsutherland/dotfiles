if !has('conceal')
    finish
endif

setlocal conceallevel=1
syntax clear rustOperator

syntax match rustOperator "=\@<!===\@!" conceal cchar=≖
syntax match rustOperator "!=" conceal cchar=≠
syntax match rustOperator "<=" conceal cchar=≤
syntax match rustOperator ">=" conceal cchar=≥

syntax match rustOperator "<<" conceal cchar=«
syntax match rustOperator ">>" conceal cchar=»

syntax match rustOperator "::" conceal cchar=∷

syntax match rustOperator "->" conceal cchar=→
syntax match rustOperator "=>" conceal cchar=⇒

syntax match rustOperator "||" conceal cchar=∥

syntax match rustOperator /;$/ conceal
syntax match rustOperator /^\s*\zs}\ze$/ conceal
syntax match rustOperator /\(^\s*\)\@<=\zs}\ze\s*/ conceal
syntax match rustOperator /\ *\zs{\ze$/ conceal

hi! link rustOperator Operator
hi! link Conceal Operator
