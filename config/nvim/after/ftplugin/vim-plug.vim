" {{{ <space><space> to open help
function! s:plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'vnew' doc | setf help
    endfor
  endif
endfunction
nnoremap <silent><buffer> <space><space> :call <sid>plug_doc()<cr>
" }}}

" {{{ gx on sha from diff
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction
nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
" }}}

" {{{ extra binds
" J / K to scroll the preview window
" CTRL-N / CTRL-P to move between the commits
" CTRL-J / CTRL-K to move between the commits and synchronize the preview window
function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction
nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
nmap <silent> <buffer> <c-j> <c-n>o
nmap <silent> <buffer> <c-k> <c-p>o
" }}}
