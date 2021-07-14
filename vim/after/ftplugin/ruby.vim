setlocal suffixesadd+=.rb
setlocal path+=lib
compiler ruby
map <buffer> <leader>bp orequire "pry": binding.pry<esc>^
imap <buffer> ,rs &;
imap <buffer> ,rS <=>
inoremap <buffer> ,tt self

" HACK: delete surrounding block (rhysd/vim-textobj-ruby)
" must call one line below `do` block
function! s:DeleteSurroundingRubyblock()
  normal dirdpd2kw
endfunction
command! DSR :call <sid>DeleteSurroundingRubyblock()
