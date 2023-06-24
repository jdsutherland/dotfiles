au BufEnter *.js nmap <buffer> ,db odebugger;<esc>^
au BufEnter *.js,*.jsx,*.ts,*.tsx imap <buffer> ,tt this.
au BufEnter *.js,*.jsx,*.ts,*.tsx nnoremap <buffer> ,C ciwthis.<c-r>"<space>=<space><c-r>"<esc>
" inoremap <buffer> ,tt this.
