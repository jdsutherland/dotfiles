runtime! ftplugin/ruby.vim

map <buffer> <leader>bp o<% require "pry": binding.pry %><esc>^

let b:sideways_custom_definitions = [
  \   {
  \     'skip_syntax':             [],
  \     'start':                   '\v<class:\s?''',
  \     'end':                     "'",
  \     'delimited_by_whitespace': 1,
  \     'brackets':                ['', ''],
  \   },
  \   {
  \     'skip_syntax':             [],
  \     'start':                   '\v<class:\s?"',
  \     'end':                     '"',
  \     'delimited_by_whitespace': 1,
  \     'brackets':                ['', ''],
  \   },
  \ ]
