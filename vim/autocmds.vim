" TODO: remove?
" " autosave when lose focus
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

" elixir
autocmd FileType elixir inoremap ,tt \|>

" javascript
" TODO: add more as needed
autocmd FileType html,eruby,htmldjango,scss,handlebars,less,css,javascript.jsx EmmetInstall
autocmd BufNewFile,BufRead *.ng EmmetInstall

" python
" autocmd filetype python nnoremap <buffer> ,f  :call jedi#goto()<CR>
" autocmd FileType python nnoremap <buffer> <leader>gj :call jedi#goto_assignments()<CR>
autocmd filetype python nnoremap <leader>bp ofrom ptpdb import set_trace<cr>set_trace()<esc>^
autocmd FileType python imap ,tt self.
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8


" misc
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact,yaml,yaml.docker-compose,json inoremap <buffer> ; :
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact,yaml,yaml.docker-compose,json inoremap <buffer> : ;
" TODO: verify
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> r; r:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> r: r;
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> t; t:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> f; f:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> T; T:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> F; F:

" go
autocmd FileType go nnoremap <buffer> ,f :GoDef<cr>
autocmd FileType go nnoremap <buffer> <silent> K :call SearchWordWithRg()<cr>
autocmd FileType go nnoremap <buffer> ,gec :GoErrCheck<cr>
autocmd FileType go nnoremap <buffer> <space>gdo :GoDoc<cr>
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
autocmd FileType go nnoremap <buffer> <space>gim :GoImport<space>
autocmd FileType go nnoremap <buffer> <space>G :GoInfo<cr>
autocmd FileType go nnoremap <buffer> <space>B :GoRun<cr><esc>
autocmd FileType go nnoremap <buffer> <space>tc :GoCoverageToggle<cr>
autocmd FileType go nnoremap <buffer> <space>gts :<C-u>call BuildGoFiles()<CR>
autocmd FileType go nnoremap <buffer> <space>gtt :GoTestFunc<cr>
" autocmd FileType go nnoremap <buffer> <space>ll :GoDefStack<cr>
" autocmd FileType go nnoremap <buffer> <space>lc :GoDefStackClear<cr>
autocmd FileType go nmap ,cL yiwofmt.Fprintf(os.Stderr, "<c-r>"; %+v\n", <c-r>")<Esc>^
" alternates
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd Filetype go set foldmethod=syntax

" c
" au FileType c,cpp  nmap ,f <Plug>(clang_complete_goto_declaration)
" autocmd BufEnter *.cpp,*.h,*.hpp,*.hxx let g:ale_cpp_clang_options = join(ncm_clang#compilation_info()['args'], ' ')
" autocmd FileType cpp,c set path=.,/usr/include,/usr/local/include,/usr/include/c++/4.2.1,/usr/local/include/glib-2.0
autocmd FileType cpp,c nmap ,cL yiwofprintf(stderr, "<c-r>": %s\n", <c-r>");<Esc>^

" {{{ vim-pencil advanced init
function! Prose()
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  " call textobj#quote#init()
  call textobj#sentence#init()

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

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
  " setlocal foldlevel=6

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
endfunction

" automatically initialize buffer by file type
" autocmd FileType markdown,mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
" }}}

" autocmd BufEnter * EnableStripWhitespaceOnSave
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" resize when closing tmux pane
autocmd VimResized * wincmd =

autocmd FileType help wincmd L

au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

" {{{ package info
function! s:ShowGemInfo()
  let gem = matchstr(getline('.'), '\v[''"]\zs(\w[-/]?)+\ze')
  if empty(gem) | return | endif

  let request_url = 'https://rubygems.org/api/v1/gems/' . gem . '.json'
  let response = webapi#http#get(request_url)
  let content = webapi#json#decode(response.content)
  let gem_info = get(content, 'info', '')
  let gem_info = substitute(trim(gem_info), '\v\n+', ' ', 'g')
  let gem_info = substitute(gem_info, '\v\s+', ' ', 'g')
  if !empty(gem_info)
    echo gem_info[:200]
  endif
endfunction
command! ShowGemInfo call <sid>ShowGemInfo()
au BufEnter * if @% ==# 'Gemfile' | nnoremap <buffer> <silent> <space><space> :ShowGemInfo<CR> | endif

function! s:ShowPackageInfo()
  let re_scoped_or_nonscoped_npm_package = '\v[''"]\zs((\@(\w+[-.]?)+\/(\w+[-.]?)+)|(\w+[-.]?)+)'
  let package = matchstr(getline('.'), re_scoped_or_nonscoped_npm_package)
  if empty(package) | return | endif

  let package_info = system('npm info ' . package . ' | sed -n 3p') | redraw!
  let package_info = substitute(trim(package_info), '\v\n+', ' ', 'g')
  let package_info = substitute(package_info, '\v\s+', ' ', 'g')
  if !empty(package_info)
    echo package_info[:200]
  endif
endfunction
command! ShowPackageInfo call <sid>ShowPackageInfo()
au BufEnter * if @% ==# 'package.json' | nnoremap <buffer> <silent> <space><space> :ShowPackageInfo<CR> | endif
" }}}
