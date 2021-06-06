" Syntax-highlight languages inside fenced markdown blocks
let g:markdown_fenced_languages = [
      \ 'css',
      \ 'diff',
      \ 'haskell',
      \ 'html',
      \ 'javascript',
      \ 'lisp',
      \ 'ruby',
      \ 'scheme',
      \ 'scss',
      \ 'sh',
      \ 'sql',
      \ 'vim'
      \ ]

" setlocal spell

" move beginning of next/prev paragraph (for LimeLight.vim) rather than inbetween
noremap <buffer> } }j
noremap <buffer> <PageDown> }j
noremap <buffer> <space><space> }j

noremap <buffer> <PageUp> { {k
noremap <buffer> { {k
