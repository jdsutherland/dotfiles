" ag
let g:ag_prg='true ; f(){ ag --column "$@" \| cut -c 1-'.(&columns - 6).' }; f'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" gist
let g:gist_post_anonymous = 1

" resize
let g:vim_resize_disable_auto_mappings = 1

" psql
let g:sql_type_default = 'pgsql'

" togglelist
let g:lt_location_list_toggle_map = '\d'
let g:lt_quickfix_list_toggle_map = '\\'

" easymotion
let g:EasyMotion_leader_key = '<Space><space>'

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'

" neomake
" let g:neomake_open_list = 2
let g:neomake_list_height = 3
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_verbose = 3

" let g:neomake_javascript_eslint_exe = 'eslint_d'
let g:neomake_javascript_enabled_makers = ['eslint']

" let g:neomake_c_enabled_makers = ['clang']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_scss_enabled_makers = ['sasslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_zsh_enabled_makers = ['shellcheck']

" monster - ruby
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


" ruby textobj
let g:textobj_ruby_more_mappings = 1

" tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30

" rspec
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets='<C-s>'

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = 'external_command'

" fzf
let g:fzf_layout = { 'window': 'new' }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_commits_log_options =
\ '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

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

" vim-titlecase
let g:titlecase_map_keys = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" vim-switch
let g:switch_mapping = "-"

" vim-test
let test#strategy = 'vtr'
let g:test#preserve_screen = 1

" togglelist
let g:toggle_list_no_mappings = 1 " Disable default mappings.

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,chai'
