autocmd VimResized * :wincmd =

" autosave when lose focus
autocmd BufLeave,FocusLost * silent! wall

" Execute macro in q
autocmd FileType vim setlocal keywordprg=:help " Open vim help under cursor

au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.babelrc set filetype=json
au BufRead,BufNewFile *.eslintrc set filetype=json

" HACK: open in default app without vim reading buffer
augroup binary_nonvim_open
   au!
   au BufReadCmd *.jpg,*.jpeg,*.png,*.gif,*.svg,*.doc,*.doc*,*.xlxs,*.xlx*,*.ppt*
     \ silent execute "!open " . shellescape(expand("<afile>")) . "&>/dev/null" |
     \ let tobedeleted = bufnr('%') | b# | exe "bd! " . tobedeleted
augroup end

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

autocmd BufReadPost *.epub,*.mobi,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout


" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" Automatically fit quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" spell
" autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
" autocmd BufRead,BufNewFile *.txt setlocal spell complete+=kspell
" autocmd BufRead,BufNewFile *.tex* setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" writing
" au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

" sql
" autocmd cursormoved *.sql call PoppyInit()

" markdown
" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr
autocmd FileType markdown nnoremap <buffer> <space>ll :Toct<cr>

" javascript
" TODO: add more as needed
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd FileType html,css,javascript.jsx EmmetInstall
autocmd FileType javascript,jsx nnoremap <buffer> ,f :TernDef<cr>
autocmd FileType javascript,jsx nnoremap <buffer> ,fs :TernDefSplit<cr>
autocmd FileType javascript,jsx nnoremap <buffer> T :TernType<cr>
autocmd FileType javascript,jsx nnoremap <buffer> <space>ll :TernDefPreview<cr><c-o>

" python
autocmd filetype python nnoremap <buffer> ,f  :call jedi#goto()<CR>
autocmd FileType python nnoremap <buffer> <leader>gj :call jedi#goto_assignments()<CR>
autocmd filetype python nmap <leader>bp ofrom ptpdb import set_trace<cr>set_trace()<esc>^

" go
autocmd FileType go,python,ruby,elixir,javascript inoremap <buffer> ; :
autocmd FileType go,python,ruby,elixir,javascript inoremap <buffer> : ;

autocmd FileType go nnoremap <buffer> ,f :GoDef<cr>
autocmd FileType go nnoremap <buffer> ,fs :GoDoc<cr>
autocmd FileType go nnoremap <buffer> <silent> K :call SearchWordWithRg()<cr>
autocmd FileType go nnoremap <buffer> <c-g> :GoInfo<cr>
autocmd FileType go nnoremap <buffer> ,gec :GoErrCheck<cr>
autocmd FileType go nnoremap <buffer> <space>gdd :GoDescribe<cr>
autocmd FileType go nnoremap <buffer> <space>gdi :GoImplements<cr>
autocmd FileType go nnoremap <buffer> <space>gde :GoWhicherrs<cr>
autocmd FileType go nnoremap <buffer> <space>gdr :GoReferrers<cr>
autocmd FileType go nnoremap <buffer> <space>gds :GoCallstack<cr>
autocmd FileType go nnoremap <buffer> <space>gdc :GoCallees<cr>
autocmd FileType go nnoremap <buffer> <space>gdC :GoCallers<cr>
autocmd FileType go nnoremap <buffer> <space>gdp :GoChannelPeers<cr>
autocmd FileType go vnoremap <buffer> <space>gdp :GoChannelPeers<cr>
autocmd FileType go vnoremap <buffer> <space>gdf :GoFreevars<cr>
autocmd FileType go nnoremap <buffer> <space>ggr :GoRename<space>
autocmd FileType go nnoremap <buffer> <space>ggi :GoImpl<space>
autocmd FileType go nnoremap <buffer> B :GoRun<cr><esc>
autocmd FileType go nnoremap <buffer> <space>tc :GoCoverageToggle<cr>
autocmd FileType go nnoremap <buffer> <space>ts :<C-u>call BuildGoFiles()<CR>
autocmd FileType go nnoremap <buffer> <space>tt :GoTestFunc<cr>
autocmd FileType go nnoremap <buffer> <space>ll :GoDefStack<cr>
autocmd FileType go nnoremap <buffer> <space>lc :GoDefStackClear<cr>
" alternates
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd Filetype go set foldmethod=syntax

" c
" au FileType c,cpp  nmap ,f <Plug>(clang_complete_goto_declaration)

" js conceal expand
" autocmd FileType javascript,jsx inoremap <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
" autocmd FileType javascript,jsx inoremap <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
" autocmd FileType javascript,jsx inoremap <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>
" autocmd FileType javascript,jsx set concealcursor=n

" omnisharp
autocmd FileType cs nnoremap ,f :OmniSharpGotoDefinition<cr>

" auto js template str html
" autocmd FileType javascript JsPreTmpl html

" ruby
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END
autocmd FileType ruby setlocal path+=lib

" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  " set showmode
  set showcmd
  set scrolloff=3
  Limelight!
  " ...
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" " vim-pencil - advanced init
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
" autocmd FileType mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" vim-pencil - high-granular
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"                             \ | call litecorrect#init()
"                             \ | setl fdo+=search
"                             \ | setl fdl=4 noru nonu nornu
"   autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
"                             \ | call litecorrect#init()
"                             \ | setl spell spl=en_us et sw=2 ts=2 noai
"   autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60})
"                             \ | call litecorrect#init()
"                             \ | setl spell spl=en_us et sw=2 ts=2 noai nonu nornu
"   autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'})
"                             \ | call litecorrect#init()
"                             \ | setl spell spl=en_us et sw=2 ts=2
" augroup END

" attempt to load directory with ranger.vim
augroup ranger
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Ranger' | endif
augroup END
fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
                \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu

autocmd BufEnter * EnableStripWhitespaceOnSave
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" autocmd BufWritePre *.py ImpSort!
autocmd FileType python,haml,coffee BracelessEnable +indent +fold
autocmd FileType yaml,ruby BracelessEnable +fold
