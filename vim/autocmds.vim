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

" fix bug between taboo and airline
autocmd TabNew * AirlineToggle
autocmd TabNew * AirlineToggle

" By default, vim thinks .md is Modula-2.
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set unnamed buffer to sh (useful for using vim run shell command)
" if @% == ""
"   autocmd BufRead,BufNewFile * set filetype=sh
" endif

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.babelrc set filetype=json
au BufRead,BufNewFile *.eslintrc set filetype=json

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" Automatically fit quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" spell
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" javascript
" TODO: add more as needed
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd FileType html,css,javascript.jsx EmmetInstall
autocmd FileType javascript,jsx nnoremap <buffer> ,f :TernDef<cr>
autocmd FileType javascript,jsx nnoremap <buffer> ,fs :TernDefSplit<cr>
autocmd FileType javascript,jsx nnoremap <buffer> T :TernType<cr>
autocmd FileType javascript,jsx nnoremap <buffer> <space>ll :TernDefPreview<cr><c-o>

" js conceal expand
autocmd FileType javascript,jsx inoremap <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
autocmd FileType javascript,jsx inoremap <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
autocmd FileType javascript,jsx inoremap <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>
autocmd FileType javascript,jsx set concealcursor=n

" omnisharp
autocmd FileType cs nnoremap ,f :OmniSharpGotoDefinition<cr>

" auto js template str html
" autocmd FileType javascript JsPreTmpl html

" fzf
autocmd! User FzfStatusLine call Fzf_statusline()

" ruby
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END
autocmd FileType ruby setlocal path+=lib

" tmuxline truecolor fix?
" if exists('$TMUX')
"     autocmd VimEnter * call tmuxline#set_statusline('vim_statusline_1')
" endif
