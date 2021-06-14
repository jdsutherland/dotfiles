" {{{ autowrite
" TODO: verify resolves quickfix-reflector write issue
function! Autowrite()
  for tabnum in range(tabpagenr('$'))
    for bufnum in tabpagebuflist(tabnum + 1)
      if bufname(bufnum) =~ '^quickfix-' | return | endif
    endfor
  endfor
  silent! wa
  if &modified
    silent! GutentagsUpdate
  endif
endfunction

augroup improved_autowrite
  autocmd!
  autocmd FocusLost,BufLeave * call Autowrite()
augroup end
" }}}

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

autocmd FileType gitcommit setlocal spell complete+=kspell

autocmd FileType elixir inoremap <buffer> ,tt \|>

autocmd FileType html,eruby,htmldjango,scss,handlebars,less,css,javascript.jsx EmmetInstall
autocmd BufNewFile,BufRead *.ng EmmetInstall

" swap ; and : for easier typing
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact,yaml,yaml.docker-compose,json inoremap <buffer> ; :
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact,yaml,yaml.docker-compose,json inoremap <buffer> : ;
" TODO: verify
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> r; r:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> r: r;
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> t; t:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> f; f:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> T; T:
autocmd FileType go,python,ruby,eruby,elixir,haskell,typescript,typescriptreact noremap <buffer> F; F:

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
au BufEnter * if expand('%:t') ==# 'Gemfile' | nnoremap <buffer> <silent> <space><space> :ShowGemInfo<CR> | endif

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
au BufEnter * if expand('%:t') ==# 'package.json' | nnoremap <buffer> <silent> <space><space> :ShowPackageInfo<CR> | endif
" }}}

" vim-plug
autocmd FileType vim syntax keyword Function Plug
autocmd FileType vim,zsh setlocal foldmethod=marker
