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
" autocmd BufRead,BufNewFile *.txt setlocal spell complete+=kspell
autocmd BufRead,BufNewFile *.tex* setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" rainbow parens around cursor
au! cursormoved * silent! call PoppyInit()

" writing
" au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

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

" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-pencil - advanced init
function! Prose()
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

endfunction

" automatically initialize buffer by file type
autocmd FileType mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" vim-pencil - high-granular
augroup pencil
  autocmd!
  autocmd FileType mkd call pencil#init()
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_us fdl=4 noru nonu nornu
                            \ | setl fdo+=search
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_us et sw=2 ts=2 noai
  autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60})
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_us et sw=2 ts=2 noai nonu nornu
  autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'})
                            \ | call litecorrect#init()
                            \ | setl spell spl=en_us et sw=2 ts=2
augroup END
