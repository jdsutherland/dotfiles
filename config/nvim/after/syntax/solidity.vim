" " we need the conceal feature (vim ≥ 7.3)
" if !has('conceal')
" 		finish
" endif

" syntax match solNiceOperator ">=" conceal cchar=≥
" syntax match solNiceOperator "<=" conceal cchar=≤
" syntax match solNiceOperator "->" conceal cchar=→
" syntax match solNiceOperator "<-" conceal cchar=˿
" syntax match solNiceOperator "=>" conceal cchar=⇒
" syntax match solNiceOperator "<=>" conceal cchar=⇔
" syntax match solNiceOperator "!=" conceal cchar=≠
" syntax match solNiceOperator " \zs\*\ze " conceal cchar=×
" syntax match solNiceOperator " \zs\/\ze " conceal cchar=÷
" syntax match solNiceOperator "==" conceal cchar=≡
" " syntax match solNiceOperator ":=" conceal cchar=≔
" syntax match solNiceOperator "||" conceal cchar=∨
" syntax match solNiceOperator "&&" conceal cchar=∧

" syntax match solNiceOperator "*" conceal cchar=⁕
" " syntax match solNiceOperator "\zs&\ze\w\+" conceal cchar=&
" syntax match solNiceOperator "++" conceal cchar=Δ
" syntax match solNiceOperator "--" conceal cchar=∇
" syntax match solNiceOperator "\.\.\." conceal cchar=…

" syntax keyword solFunction function conceal cchar=ƒ
" syntax keyword solFuncReturns returns conceal cchar=⇚
" syntax keyword solKeyword return conceal cchar=⇚
" syntax keyword solKeyword constant conceal cchar=𝔠
" syntax keyword solKeyword enum conceal cchar=∈
" " syntax keyword solKeyword event conceal cchar=ė
" syntax keyword solKeyword external conceal cchar=⌾
" syntax keyword solKeyword internal conceal cchar=○
" syntax keyword solKeyword public conceal cchar=∙
" syntax keyword solKeyword modifier conceal cchar=Ɱ
" syntax keyword solKeyword let conceal cchar=ʟ
" syntax keyword solKeyword throw conceal cchar=ŧ
" syntax keyword solKeyword memory conceal cchar=ᴹ
" syntax keyword solKeyword storage conceal cchar=ˢ

" syntax keyword solKeyword new conceal cchar=μ
" syntax keyword solKeyword delete conceal cchar=✗
" syntax keyword solKeyword struct conceal cchar=⊇
" syntax keyword soldKeyword interface conceal cchar=𐊭
" syntax keyword solNiceKeyword length conceal cchar=#
" " syntax keyword solKeyword mapping conceal cchar=⚨

" syntax keyword solBuiltinType address conceal cchar=&
" syntax keyword solBuiltinType bool conceal cchar=ƀ
" syntax keyword solBuiltinType byte bytes bytes1 bytes2 bytes3 bytes4 bytes5 bytes6 bytes7 bytes8 bytes9 bytes10 bytes11 bytes12 bytes13 bytes14 bytes15 bytes16 bytes17 bytes18 bytes19 bytes20 bytes21 bytes22 bytes23 bytes24 bytes25 bytes26 bytes27 bytes28 bytes29 bytes30 bytes31 bytes32 conceal cchar=฿
" " syntax keyword solBuiltinType string conceal cchar=⟆
" syntax keyword solBuiltinType string string1 string2 string3 string4 string5 string6 string7 string8 string9 string10 string11 string12 string13 string14 string15 string16 string17 string18 string19 string20 string21 string22 string23 string24 string25 string26 string27 string28 string29 string30 string31 string32 conceal cchar=⟆
" " syntax keyword solBuiltinType int conceal cchar=ℤ
" syntax keyword solBuiltinType int int8 int16 int24 int32 int40 int48 int56 int64 int72 int80 int88 int96 int104 int112 int120 int128 int136 int144 int152 int160 int168 int178 int184 int192 int200 int208 int216 int224 int232 int240 int248 int256 conceal cchar=ⅰ
" " syntax keyword solBuiltinType uint conceal cchar=Ⅰ
" syntax keyword solBuiltinType uint uint8 uint16 uint24 uint32 uint40 uint48 uint56 uint64 uint72 uint80 uint88 uint96 uint104 uint112 uint120 uint128 uint136 uint144 uint152 uint160 uint168 uint178 uint184 uint192 uint200 uint208 uint216 uint224 uint232 uint240 uint248 uint256 conceal cchar=Ⅰ
" syntax keyword solConstant true conceal cchar=✓
" syntax keyword solConstant false conceal cchar=✗
" syntax keyword solConstant this conceal cchar=@
" " syntax keyword solBuiltinType int32 conceal cchar=ⅰ
" " syntax keyword solBuiltinType int64 conceal cchar=ⅱ
" " syntax keyword solBuiltinType uint32 conceal cchar=Ⅰ
" " syntax keyword solBuiltinType uint64 conceal cchar=Ⅱ

" syntax match solNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
" syntax match solNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
" syntax match solNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ

" syntax keyword solStatement break conceal cchar=↯
" syntax keyword solStatement continue conceal cchar=↰

" " syntax match solNiceOperator /\S\zs()\ze\(\S\| [^{]\)/ conceal
" syntax match solNiceOperator /\ *{$/ conceal
" syntax match solNiceOperator /^}$/ conceal cchar=}
" syntax match solNiceOperator /^\s*\zs}\ze$/ conceal
" syntax match solNiceOperator /\(^\s*\)\@<=\zs}\ze\s*/ conceal
" syntax match solNiceOperator /\ *\zs{\ze$/ conceal
" syntax match solNiceOperator /;$/ conceal
" syntax keyword solKeyword import conceal cchar=ɪ

" hi link solNiceOperator Operator
" hi! link Conceal Operator
" hi! Conceal ctermbg=Black ctermfg=Magenta

" setlocal tabstop=4
" setlocal shiftwidth=4
