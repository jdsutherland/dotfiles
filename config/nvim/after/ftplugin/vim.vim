setlocal foldmethod=marker
setlocal sw=2

" execute visual selection (works for functions)
vnoremap <buffer> <c-x> "xy:execute substitute(@x,"\n\\",'','g')<cr>
nnoremap <buffer> <space>x :execute getline('.')<cr>
