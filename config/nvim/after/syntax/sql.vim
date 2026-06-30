" if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
" 	finish
" endif

" syntax keyword sqlNiceKeyword function conceal cchar=ƒ
" syntax keyword sqlNiceKeyword return conceal cchar=⇚
" syntax keyword sqlNiceKeyword select conceal cchar=s
" syntax keyword sqlNiceKeyword from conceal cchar=ｆ
" syntax keyword sqlNiceKeyword where conceal cchar=ᴡ
" syntax keyword sqlNiceKeyword limit conceal cchar=ʟ
" syntax keyword sqlNiceKeyword values conceal cchar=V

" " syntax keyword sqlNiceKeyword create conceal cchar=μ
" syntax keyword sqlNiceKeyword begin conceal cchar={
" syntax keyword sqlNiceOperator end conceal cchar=}

" syntax keyword sqlNiceKeyword and conceal cchar=∧
" syntax keyword sqlNiceKeyword or conceal cchar=∨
" " syntax match sqlNiceOperator "&&" conceal cchar=∧
" " syntax match sqlNiceOperator "||=\@!" conceal cchar=∨

" syntax keyword sqlOperator not conceal cchar=¬
" syntax match sqlNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
" syntax keyword sqlNiceOperator all conceal cchar=∀
" syntax keyword sqlNiceOperator in conceal cchar=∈
" syntax keyword sqlNiceOperator any conceal cchar=∃
" syntax match sqlNiceOperator "\<not in\>" conceal cchar=∉
" syntax match sqlNiceOperator "\<not exists\>" conceal cchar=∄
" " syntax match sqlNiceOperator " \zs\*\ze " conceal cchar=⁕
" syntax match sqlNiceOperator " \zs\/\ze "  conceal cchar=÷

" " syntax keyword sqlNiceKeyword is conceal cchar==
" " syntax keyword sqlNiceKeyword as conceal cchar=⇠
" " syntax match sqlNiceKeyword "\<as " conceal cchar=@

" syntax keyword sqlFunction sum conceal cchar=∑
" syntax keyword sqlFunction typeof conceal cchar=¤

" syntax keyword sqlNiceKeyword true conceal cchar=✓
" syntax keyword sqlNiceKeyword false conceal cchar=✗
" syntax keyword sqlNiceKeyword null conceal cchar=∅
" syntax keyword sqlNiceKeyword asc conceal cchar=↑
" syntax keyword sqlNiceKeyword desc conceal cchar=↓
" syntax keyword sqlNiceKeyword like conceal cchar=≈
" syntax keyword sqlNiceKeyword ilike conceal cchar=≅
" syntax keyword sqlNiceKeyword into conceal cchar=⚩

" syntax match sqlNiceKeyword "\<primary key\>" conceal cchar=🔑
" syntax match sqlNiceKeyword "\<foreign key\>" conceal cchar=🔐
" syntax keyword sqlNiceKeyword references conceal cchar=⇢
" " syntax match sqlNiceKeyword "\<references\>" conceal cchar=→
" " syntax match sqlNiceKeyword "\<inner\>" conceal
" syntax keyword sqlNiceKeyword inner conceal
" syntax match sqlNiceKeyword "\v<full (outer)?" conceal cchar=●
" syntax match sqlNiceKeyword "\v<left (outer)?" conceal cchar=◖
" syntax match sqlNiceKeyword "\v<right (outer)?" conceal cchar=◗

" " syntax keyword sqlNiceKeyword let conceal cchar=ʟ
" " syntax keyword sqlNiceKeyword setlocal conceal cchar=𐊖
" " syntax keyword vimMapModKey silent conceal cchar=♪
" " syntax match sqlNiceKeyword " \zs\.\ze " conceal cchar=+
" " " syntax match sqlNiceOperator "\_\\\_" conceal

" " syntax match sqlNiceOperator "\.\.\." conceal cchar=…
" syntax match sqlNiceOperator ":=" conceal cchar=≔
" syntax match sqlNiceOperator "=\@<!===\@!" conceal cchar=≡
" syntax match sqlNiceOperator "=\@<!==#=\@!" conceal cchar=≣
" syntax match sqlNiceOperator "!==\@!" conceal cchar=≠
" syntax match sqlNiceOperator "\s\+\zs!==\ze\s\+" conceal cchar=≢
" syntax match sqlNiceOperator "\s\+\zs!==\ze\s\+" conceal cchar=≢
" syntax match sqlNiceOperator "=\~" conceal cchar=≆
" syntax match sqlNiceOperator "\s\zs<=\ze\s" conceal cchar=≤
" syntax match sqlNiceOperator "\s\zs>=\ze\s" conceal cchar=≥

" syntax match sqlNiceKeyword "\v<insert into>" conceal cchar=⇒

" " hi! link vimNice Operator
" hi link sqlNiceOperator Operator
" hi link sqlNiceStatement Statement
" hi link sqlNiceKeyword Keyword
" hi link sqlNiceBuiltin Builtin
" hi link sqlNiceSpecial Special
" hi! link Conceal Operator
" hi! Conceal ctermbg=Black ctermfg=Magenta
