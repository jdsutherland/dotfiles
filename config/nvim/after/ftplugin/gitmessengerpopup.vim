let s:re_commit = '^Commit: \+\zs[[:xdigit:]]\{7,}$'

function! s:commit() abort
  return matchstr(getline(2), s:re_commit)
endfunction

function! s:tmux_show() abort
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git show --patch-with-stat " . s:commit() . "; read'")
endfunction

function! s:gbrowse() abort
  exec ':GBrowse ' . s:commit()
endfunction

" https://docs.github.com/en/rest/reference/repos#list-pull-requests-associated-with-a-commit
"
" Uses the gh CLI rather than webapi-vim: gh resolves {owner}/{repo} from the
" repo in cwd and handles auth itself, so this needs no hand-managed token.
" The old version read a PAT from ~/.gist-vim, which only ever existed on the
" mac -- X was broken on Omarchy.
function! s:open_github_pr() abort
  let commit = s:commit()
  if empty(commit)
    echo 'git-messenger: no commit found in popup'
    return
  endif

  if !executable('gh')
    echo 'git-messenger: gh not found on PATH'
    return
  endif

  let url = trim(system('gh api ' . shellescape('repos/{owner}/{repo}/commits/' . commit . '/pulls')
        \ . ' --jq ' . shellescape('.[0].html_url // empty') . ' 2>/dev/null'))

  if v:shell_error
    echo 'git-messenger: gh lookup failed (commit may not be pushed yet)'
    return
  endif
  if empty(url)
    echo 'git-messenger: No associated pull request for commit'
    return
  endif

  " vim.ui.open picks the right opener per platform (open / xdg-open), unlike
  " netrw#BrowseX which this used to call.
  call v:lua.vim.ui.open(url)
endfunction

" git-messenger builds its `?` help from the popup object's opts.mappings
" (see gitmessenger#popup echo_help), so registering entries there documents
" these keys without forking the plugin. The popup sets b:__gitmessenger_popup
" *after* it sets &filetype -- which is what triggers this ftplugin -- so the
" variable isn't available yet; defer to the next event loop tick. The
" mappings below are still created explicitly, because the plugin's own
" nnoremap loop has already run by then.
function! s:register_help(...) abort
  if !exists('b:__gitmessenger_popup')
    return
  endif
  let l:opts = b:__gitmessenger_popup.opts
  if !has_key(l:opts, 'mappings')
    let l:opts.mappings = {}
  endif
  let l:opts.mappings['S'] = [function('s:tmux_show'), 'Show commit in a tmux split']
  let l:opts.mappings['x'] = [function('s:gbrowse'), 'Open commit in browser (GBrowse)']
  let l:opts.mappings['X'] = [function('s:open_github_pr'), 'Open associated GitHub PR']
endfunction

function! s:setup_gitmessengerpopup() abort
  nnoremap <buffer><silent>S :<C-u>call <SID>tmux_show()<CR>
  nnoremap <buffer><silent>x :<C-u>call <SID>gbrowse()<CR>
  nnoremap <buffer><silent>X :<C-u>call <SID>open_github_pr()<CR>
  call timer_start(0, function('s:register_help'))
endfunction
call <SID>setup_gitmessengerpopup()
