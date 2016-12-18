autocmd VimResized * :wincmd =

" autosave when lose focus
autocmd BufLeave,FocusLost * silent! wall

" run neomake on every save
autocmd! BufWritePost * silent! Neomake
autocmd! QuitPre * let g:neomake_verbose = 0
" TODO: why doesn't this work?
" strip whitespace on every save
" autocmd! BufWritePost * call StripTrailingWhitespaces()

" Execute macro in q
autocmd FileType vim setlocal keywordprg=:help " Open vim help under cursor

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
au BufRead,BufNewFile *.json set filetype=json

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" Automatically fit quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Resume last edit position on opening buffer
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" spell
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" javascript
" TODO: add more as needed
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd FileType html,css,javascript.jsx EmmetInstall

" fzf
autocmd! User FzfStatusLine call Fzf_statusline()

" ruby
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END
autocmd FileType ruby setlocal path+=lib


