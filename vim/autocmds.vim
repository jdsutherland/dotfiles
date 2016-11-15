autocmd VimResized * :wincmd =

" autosave when lose focus
autocmd BufLeave,FocusLost * silent! wall

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

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" ruby
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END
autocmd FileType ruby setlocal path+=lib
