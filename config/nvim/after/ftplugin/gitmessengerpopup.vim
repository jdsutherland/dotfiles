let s:re_commit = '^Commit: \+\zs[[:xdigit:]]\{7,}$'

function! s:tmux_show() abort
  let commit = matchstr(getline(2), s:re_commit)
  call system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git show --patch-with-stat " . commit . "; read'")
endfunction

function! s:gbrowse() abort
  let commit = matchstr(getline(2), s:re_commit)
  exec ':GBrowse ' . commit
endfunction

" https://docs.github.com/en/rest/reference/repos#list-pull-requests-associated-with-a-commit
function! s:open_github_pr() abort
  let commit = matchstr(getline(2), s:re_commit)
  let remote_url = trim(system("git remote get-url origin"))
  let [owner, repo] = split(remote_url, '/')[-2:-1]
  let owner = substitute(owner, '.*:', '', '')
  let repo = substitute(repo, '\.git', '', '')

  let request_url = 'api.github.com/repos/' . owner . '/' . repo . '/commits/' . commit . '/pulls'
  " NOTE: uses github Personal Access Token (shared with gist-vim for simplicity)
  let token = join(readfile(expand('~/.gist-vim')), '')
  let response = webapi#http#get(request_url, '', {"Accept": "application/vnd.github.groot-preview+json",
                                                 \ "Authorization": "token " . token})
  if response.status != 200
    echo 'git-messenger: ' . response.status . ' ' . response.message
    return
  endif
  let content = webapi#json#decode(response.content)
  if len(content) < 1 || empty(content[0]._links.html.href)
    echo 'git-messenger: No associated pull request for commit'
    return
  endif
  call netrw#BrowseX(content[0]._links.html.href, 0)
endfunction

function! s:setup_gitmessengerpopup() abort
  nnoremap <buffer><silent>S :<C-u>call <SID>tmux_show()<CR>
  nnoremap <buffer><silent>x :<C-u>call <SID>gbrowse()<CR>
  nnoremap <buffer><silent>X :<C-u>call <SID>open_github_pr()<CR>
endfunction
call <SID>setup_gitmessengerpopup()
