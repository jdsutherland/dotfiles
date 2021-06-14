if !has('conceal')
	finish
endif

syntax keyword yamlBoolean true conceal cchar=✓
syntax keyword yamlBoolean false conceal cchar=✗
