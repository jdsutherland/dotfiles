nnoremap <space>ga :Git add %<CR>
nnoremap <space>gA :Git add .<CR>
nnoremap <space>gc :tab Git commit -v -q<CR>
nnoremap <space>gt :vert Git commit -v -q %:p<CR>
nnoremap <space>gb :Git blame<CR><c-w><c-p>
nnoremap <space>gB :GBrowse<CR>
nnoremap <space>gp :vert Git add --patch<CR>
nnoremap <space>ge :Gedit!<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! 0Glog<CR>
nnoremap <space>gL :GitLog<space>
nnoremap <space>gP :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gbr :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dp :diffput<space>
nnoremap <leader>dg :diffget<space>

function! ToggleGStatus()
  if buflisted(bufname('fugitive:///*/.git//$'))
    execute ":bdelete" bufname('fugitive:///*/.git/')
    wincmd p
  else
    vert Git
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()
nnoremap <localleader>g :ToggleGStatus<cr>
