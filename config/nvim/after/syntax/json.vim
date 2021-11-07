if !has('conceal')
	finish
endif

syntax keyword jsonBoolean true conceal cchar=✓
syntax keyword jsonBoolean false conceal cchar=✗
