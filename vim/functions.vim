function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" function! SearchWordWithAg()
"   execute 'FzfAg' expand('<cword>')
" endfunction

function! SearchWordWithRg()
  let l:word = expand('<cword>')
  execute 'Rg' l:word
endfunction

" function! SearchVisualSelectionWithAg() range
"   let old_reg = getreg('"')
"   let old_regtype = getregtype('"')
"   let old_clipboard = &clipboard
"   set clipboard&
"   normal! ""gvy
"   let selection = getreg('"')
"   call setreg('"', old_reg, old_regtype)
"   let &clipboard = old_clipboard
"   execute 'FzfAg' selection
" endfunction

function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    else
        Gstatus
    endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

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

function! s:OpenTmuxGitFileFollowHistory()
  let filepath=shellescape(expand('%'))
  call system("tmux splitw -h -c '#{pane_current_path}' 'git log --patch --follow " . filepath . "; read'")
endfunction
command! OpenTmuxGitFileFollowHistory :call <sid>OpenTmuxGitFileFollowHistory()

function! s:OpenTmuxGitFileFollowHistoryReverse()
  let filepath=shellescape(expand('%'))
  call system("tmux splitw -h -c '#{pane_current_path}' 'git log --patch --reverse --follow " . filepath . "; read'")
endfunction
command! OpenTmuxGitFileFollowHistoryReverse :call <sid>OpenTmuxGitFileFollowHistoryReverse()

function! s:OpenTmuxGitFileFullHistory()
  let filepath=shellescape(expand('%'))
  call system("tmux splitw -h -c '#{pane_current_path}' 'git log --patch --full-diff " . filepath . "; read'")
endfunction
command! OpenTmuxGitFileFullHistory :call <sid>OpenTmuxGitFileFullHistory()

function! s:OpenTmuxGitFileFullHistoryReverse()
  let filepath=shellescape(expand('%'))
  call system("tmux splitw -h -c '#{pane_current_path}' 'git log --patch --reverse --full-diff " . filepath . "; read'")
endfunction
command! OpenTmuxGitFileFullHistoryReverse :call <sid>OpenTmuxGitFileFullHistoryReverse()

" TODO - how to make this work?
" function! ES6js()
"   %s/var/const/g
"   %s/\"/\'/g
"   %s/function\s*()/\(\) \=>/g
" endfunction
" command! ES6js :call <sid>ES6js()

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
endfunction
command! ResizeMin :call <sid>ResizeMin()

function! s:SysPasteTrimNewlines()
  execute "normal \<Plug>SystemPasteLine"
  execute '%s/\r/\r'
  execute 'nohl'
endfunction
command! PPP :call <sid>SysPasteTrimNewlines()
