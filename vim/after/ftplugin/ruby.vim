setlocal suffixesadd+=.rb
setlocal path+=lib
compiler ruby
map <buffer> <leader>bp orequire "pry": binding.pry<esc>^
imap <buffer> ,rs &;
imap <buffer> ,rS <=>
inoremap <buffer> ,tt self
