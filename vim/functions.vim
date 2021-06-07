function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join (keys(typo), '\|').'/\=typo[submatch(0)]/ge'
    :%s/\r/ /
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
    wincmd p
  else
    vert Git
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

" tmux runner
function! SendFileViaVtr()
  let runners = {
        \ 'haskell': 'ghci',
        \ 'ruby': 'ruby',
        \ 'javascript': 'node',
        \ 'python': 'python',
        \ 'sh': 'sh'
        \ }
  if has_key(runners, &filetype)
    let runner = runners[&filetype]
    let local_file_path = expand('%')
    execute join(['VtrSendCommandToRunner', runner, local_file_path])
  else
    echoerr 'Unable to determine runner'
  endif
endfunction

" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" {{{ tmux git history
function! s:TmuxGitIndividualFileHistory()
  let filepath = shellescape(expand('%'))
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --patch --follow " . filepath . "; read'")
endfunction
command! TmuxGitIndividualFileHistory :call <sid>TmuxGitIndividualFileHistory()

function! s:TmuxGitFileIndividualHistoryReverse()
  let filepath = shellescape(expand('%'))
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --patch --reverse --follow " . filepath . "; read'")
endfunction
command! TmuxGitFileIndividualHistoryReverse :call <sid>TmuxGitFileIndividualHistoryReverse()

function! s:TmuxGitFileFullHistory()
  let filepath = shellescape(expand('%'))
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --stat --patch --full-diff " . filepath . "; read'")
endfunction
command! TmuxGitFileFullHistory :call <sid>TmuxGitFileFullHistory()

function! s:TmuxGitFileFullHistoryReverse()
  let filepath=shellescape(expand('%'))
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --stat --patch --reverse --full-diff " . filepath . "; read'")
endfunction
command! TmuxGitFileFullHistoryReverse :call <sid>TmuxGitFileFullHistoryReverse()
" }}}

" run :GoBuild or :GoTestCompile based on the go file
function! BuildGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Don't use gutentags for go (gotags)
function! MyCustomGutentagsEnableFunc(path) abort
    return fnamemodify(a:path, ':e') != 'go'
endfunction
let g:gutentags_enabled_user_func = 'MyCustomGutentagsEnableFunc'

" Remove `#` style comments (useful for rails generators)
function! s:RemoveRubyComments()
  execute '%s/^\s*#.*\n//g'
  execute '%s/\(\n\n\)\n\+/\1/g'
  execute 'nohl'
  norm! gg
endfunction
command! RemoveRubyComments :call <sid>RemoveRubyComments()

function! ResizeMin()
  if line('$') < winheight(winnr()) | exe 'resize ' . line('$') | endif
  set winfixheight
endfunction
command! ResizeMin :call <sid>ResizeMin()
nnoremap <silent> <cr>m :call ResizeMin()<CR>

function! s:SysPasteTrimNewlines()
  execute "normal \<Plug>SystemPasteLine"
  execute '%s/\r/\r'
  execute 'nohl'
endfunction
command! PPP :call <sid>SysPasteTrimNewlines()

" fzf delete buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction
function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
    \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
    \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias('grep', 'Grepper')
call SetupCommandAlias('GG', 'GrepperRg')

function! VisualStarSearchSet(cmdtype,...)
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @/ = substitute(@/, '\.', '\\.', 'g')
  let @" = temp
endfunction
