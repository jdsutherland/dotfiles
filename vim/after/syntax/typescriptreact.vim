if exists('g:no_javascript_conceal') || !has('conceal') || &enc != 'utf-8'
	finish
endif
syn keyword jsxAttrib className conceal cchar=ℂ
" syn match jsxAttrib "id\>" conceal cchar=#
syn keyword jsxAttrib value conceal cchar=≣
syn keyword jsxAttrib selected conceal cchar=✓
syn keyword jsxTagName div conceal cchar=.
syn keyword jsxTagName span conceal cchar=⇒
syn keyword jsxTagName section conceal cchar=§
syn keyword jsxTagName article conceal cchar=⫫
syn keyword jsxTagName li conceal cchar=•
syn keyword jsxTagName button conceal cchar=🔘
syn keyword jsxTagName option conceal cchar=⌥
syn keyword jsxTagName tr conceal cchar=⇆
syn keyword jsxTagName td conceal cchar=☐
syn keyword jsxTagName blockquote conceal cchar="

hi! link Conceal Operator
hi! Conceal guifg=LightRed
