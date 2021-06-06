setlocal suffixesadd+=.rb
setlocal path+=lib
compiler ruby
imap <buffer> <leader>bp orequire "pry": binding.pry<esc>^
imap <buffer> ,rs &;
imap <buffer> ,rS <=>
inoremap <buffer> ,tt self
