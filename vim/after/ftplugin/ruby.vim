setlocal suffixesadd+=.rb
setlocal path+=lib
compiler ruby
map <leader>bp orequire "pry": binding.pry<esc>^
imap ,rs &;
imap ,rS <=>
inoremap <buffer> ,tt self
