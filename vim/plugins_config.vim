" ag
let g:ag_prg='true ; f(){ ag --column "$@" \| cut -c 1-'.(&columns - 6).' }; f'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'

" resize
let g:vim_resize_disable_auto_mappings = 1

" psql
let g:sql_type_default = 'pgsql'

" easymotion
let g:EasyMotion_leader_key = '<Space><space>'

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'

" neomake
let g:neomake_open_list = 2
let g:neomake_list_height = 3
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_javascript_eslint_maker = {
            \ 'args': ['--no-color', '--format'],
            \ 'errorformat': '%f: line %l\, col %c\, %m'
            \ }
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_c_enabled_makers = ['clang']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_scss_enabled_makers = ['sasslint']
" let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_zsh_enabled_makers = ['shellcheck']

" monster - ruby
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

" rspec
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<a-s>"

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" fzf
let g:fzf_layout = { 'window': 'new' }
let g:fzf_command_prefix = 'Fzf'

" airline
let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':r'
let g:airline#extensions#tabline#show_tab_nr = 1

" vim-todo
let g:simple_todo_map_keys = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" vim-switch
let g:switch_mapping = "-"

" vim-test
let test#strategy = 'neovim'
let g:test#preserve_screen = 1

" togglelist
let g:toggle_list_no_mappings = 1 " Disable default mappings.

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'
