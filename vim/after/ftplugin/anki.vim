let cloze_to_end_of_line = 'v4S}gvS}lac1::'

if !empty(@q)
  let @q = cloze_to_end_of_line
else
  let @c = cloze_to_end_of_line
endif

let b:surround_120 = "{{c1::\r}}"
nmap <buffer>,X ysiwxe

