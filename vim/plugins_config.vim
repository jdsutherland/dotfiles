" ag
let g:ag_prg='true ; f(){ ag --column "$@" \| cut -c 1-'.(&columns - 6).' }; f'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang/include'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/HEAD-0193305/'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

if !exists('g:deoplete#omni#functions')
    let g:deoplete#omni#functions = {}
endif

set completefunc=autoprogramming#complete

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
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
let g:EasyMotion_leader_key = '<M-u>'

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'

" poppy - rainbow parens
augroup Poppy
  au!
augroup END
nnoremap <silent><c-p> :call clearmatches() \| let g:poppy = -get(g:,'poppy',-1) \|
      \ exe 'au! Poppy CursorMoved *' . (g:poppy > 0 ? ' call PoppyInit()' : '') <cr>

" neoformat

let g:easy_align_delimiters = {
\ '/': { 'pattern': '/[/*]/' },
\ '>': { 'pattern': '>>\|=>\|>' },
\ }


" ale linting
let g:ale_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_eslint_use_global = 1
" let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fixers = {
      \ 'javascript': ['prettier_eslint', 'eslint'],
      \ 'java': ['google_java_format'],
      \ 'json': ['prettier'],
      \ 'solidity': 'solium',
      \ 'go': ['gofmt'],
      \ 'ruby': ['rubocop'],
      \ }
let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow'],
      \ 'java': ['javac'],
      \ 'cs': ['mcs'],
      \ 'c': ['cppcheck', 'clang'],
      \ 'cpp': ['cppcheck', 'clang'],
      \ 'go': ['gometalinter'],
      \ 'ruby': ['ruby', 'rubocop', 'reek'],
      \ 'eruby': ['erubis'],
      \ }

let g:ale_fixers.javascript = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--no-bracket-spacing --single-quote'

let g:ale_fixers.ruby = [
      \ 'remove_trailing_lines',
      \ 'rubocop']

let g:ale_fixers.python = [
      \ 'remove_trailing_lines',
      \ 'add_blank_lines_for_python_control_statements',
      \ 'isort',
      \ 'autopep8',
      \ 'yapf']

let g:ale_c_clang_options = '-std=c11 -Wall -c -O0 -I. -I./src -I./include'
let g:ale_c_gcc_options = '-std=c99 -pedantic -Wall -Wextra -Werror -Wundef -Wunreachable-code -Wpointer-arith -Wfloat-equal -Wswitch-default -Wconversion -Wshadow -fstack-protector-all -Wformat -Wformat-security -Werror=format-security'
let g:ale_linters.c = ['clang', 'gcc']
" TODO do i want this?
let g:ale_ruby_rubocop_options = '--rails --display-style-guide'

nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)
" Linting on all changes felt too aggressive. The below settings calls lint on
" certain events, either when I stop interacting or when entering / leaving
" insert mode
set updatetime=1000
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertLeave * call ale#Lint()
autocmd TextChanged * call ale#Lint()
let g:ale_lint_on_text_changed = 0
let g:ale_linter_aliases = {
      \ 'zsh': 'sh'
      \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
set statusline+=%=
set statusline+=\ %{ALEGetStatusLine()}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" omnisharp - dotnet
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_server_type = 'v1'
" let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 100

" ruby textobj
let g:textobj_ruby_more_mappings = 1
" ruby omni
let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1
let g:ruby_operators = 1
" let ruby_space_errors = 1
let g:ruby_minlines = 150

let g:ruby_hl_lvar_hl_group = 'rubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 1

" tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30

" rspec
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" snippets
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-J>'

" nvim-completion-manager ultisnips
au User CmSetup call cm#register_source({'name' : 'cm-css',
        \ 'priority': 9,
        \ 'scoping': 1,
        \ 'scopes': ['css','scss'],
        \ 'abbreviation': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'cm_refresh_patterns':['[\w\-]+\s*:\s+'],
        \ 'cm_refresh': {'omnifunc': 'csscomplete#CompleteCSS'},
        \ })

" let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
let g:AutoPairsMapCR = 1

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = 'external_command'

" fzf
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" let g:fzf_nvim_statusline = 0

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'ctrl-enter,ctrl-s'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" fix black color
hi Number ctermfg=14

let g:fzf_commits_log_options =
\ '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let g:rg_command = '
\ rg --no-hidden --column --line-number --no-heading --fixed-strings --smart-case --follow --color "always"
\ -g "!{.git,node_modules,vendor,build,plugged,lib,dist}/*"
\ -g "*.{lua,js,ts,coffee,jsx,json,php,styl,jade,html,css,scss,config,py,cpp,c,cs,h,go,hs,rb,erb,conf,hbs,sh,sql,sol,java}" '

" let g:rg_command = '
" \ -g "!*.{lock,min.js,swp,o,zip}"
  " \ rg --column --line-number --no-heading --fixed-strings --smart-case --no-ignore --follow --color "always"
  " \ -g "!{.git,node_modules,vendor,build,plugged,lib,dist}/*" '

" TODO?(if desired): whitelist of filetypes

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_command . shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:70%:hidden')
  \           : fzf#vim#with_preview('right:50%', ';'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let g:fzf_files_options =
  \ '--preview "(bat --theme=TwoDark --color=always {}) 2> /dev/null"'

" fzf mru files
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })
function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '\'),
"   \                 <bang>0)

" goyo
let g:goyo_width = 100
let g:goyo_height = 100


" airline
" let g:airline_theme='base16_default'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tagbar#flags = 'fs'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'

let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
" display root buffer/filename instead of full path
let g:airline_section_c = '%t'
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" vim-todo
let g:simple_todo_map_keys = 0

" vim-titlecase
let g:titlecase_map_keys = 0

" vim-markdown
let g:vim_markdown_toc_autofit = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1

let g:vim_markdown_fenced_languages = ['psql=sql', 'js=javascript', 'rb=ruby', 'erb=eruby', 'py=python', 'csharp=cs']

" vim-switch
let g:switch_mapping = "-"

" vim-test
let test#strategy = 'vtr'
let g:test#preserve_screen = 1
let g:test#go#gotest#options = '-v'

" togglelist
let g:toggle_list_no_mappings = 1 " Disable default mappings.

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" clever-f
let g:clever_f_not_overwrites_standard_mappings=1

" writing
let g:languagetool_jar = '/usr/local/Cellar/languagetool/3.6/libexec/languagetool-commandline.jar'
let g:languagetool_lang = 'en-US'
let g:grammarous#languagetool_cmd = 'languagetool'
" let g:lexical#thesaurus_key = '<c-s><c-t>'

let g:tq_mthesaur_file='~/.vim/spell/thesaurus/mthesaur.txt'
nnoremap <c-s><c-t> :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <c-s><c-t> y:ThesaurusQueryReplace <C-r>"<CR>

" rainbow
let g:rainbow_active = 1

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,chai,flux,handlebars,requirejs,sugar,ramda'

" pangloss javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "∅"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_equality             = "≡"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "∬"
let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "⁢"
" let g:javascript_conceal_underscore_arrow_function = "⁢"

" jsx
let g:vim_jsx_pretty_colorful_config = 1

" flow
let g:flow#autoclose = 1

" Rappel
" let g:rappel#term       = 'vsp | term '
let g:rappel#term = ' VtrSendCommandToRunner cd $(dirname %:p) > /dev/null; echo;'
let g:rappel#launch     = 'chrome %'
let g:rappel#default    = g:rappel#term

let g:rappel#custom_repls = {
\ 'ruby': {
\   'repl': 'pry %:p',
\   'run': 'ruby %:p',
\ },
\ 'python': {
\   'repl': 'ptpython %:p',
\   'run': 'python %:p',
\ },
\ 'go': {
\   'repl': 'dlv debug %:p',
\   'run': 'go run %:p',
\ },
\ 'c': {
\   'compiler': 'gcc % -Wall -g',
\   'run': 'gcc %:p -Wall && ./a.out',
\   'repl': 'make debug && make dgb || sudo cgdb a.out',
\   'launch': './a.out',
\ },
\ 'javascript': {
\   'repl': 'node --inspect -b --eval %:p',
\   'run': 'babel-node %:p',
\   'launch': 'ndb %:p',
\ },
\}

" scratch
let g:scratch_no_mappings = 1

" autopairs
let g:AutoPairsShortcutJump = ''

let g:rooter_manual_only = 1

" conflicted
let g:diffget_local_map = ',dgl'
let g:diffget_upstream_map = ',dgu'

nmap ,G <Plug>GrepOperatorOnCurrentDirectory
vmap ,G <Plug>GrepOperatorOnCurrentDirectory

" make consistant with UltiSnips jump trigger
let g:user_emmet_next_key = '<C-j>'

let g:echodoc_enable_at_startup = 1
" let g:echodoc#type = 'signature'

" tagbar
let g:tagbar_compact = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_indent = 1
let g:tagbar_width = 35
let g:tagbar_expand = 1
" let g:tagbar_hide_nonpublic = 1
let g:tagbar_map_previewwin= "O"
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0

let g:gutentags_define_advanced_commands = 1
" tagbar language config {{{1 "
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" 1}}} "


let g:ranger_map_keys = 0
let g:LoupeHighlightGroup='Error'
" let g:LoupeCenterResults=0

let g:pymode_options = 0
let g:pymode_folding = 1
let g:pymode_doc_bind = ',K'
let g:pymode_lint = 0

let g:grep_operator_set_search_register = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_list_type = "quickfix"
let g:go_fold_enable = ['import', 'varconst', 'package_comment']
" optionally configure guru scope per project
" let g:go_guru_scope = ["..."]

let g:TerminusMouse=0

let g:projectionist_heuristics = {
      \   '*': {
      \     '*.c': {
      \       'alternate': '{}.h',
      \       'type': 'source'
      \     },
      \     '*.cpp': {
      \       'alternate': '{}.h',
      \       'type': 'source'
      \     },
      \     '*.h': {
      \       'alternate': '{}.c',
      \       'type': 'header'
      \     },
      \     '*.js': {
      \       'alternate': [
      \         '{dirname}/{basename}.test.js',
      \         '{dirname}/__tests__/{basename}-test.js',
      \         '{dirname}/__tests__/{basename}-mocha.js'
      \       ],
      \       'type': 'source'
      \     },
      \     '*.test.js': {
      \       'alternate': '{basename}.js',
      \       'type': 'test',
      \     },
      \     '**/__tests__/*-mocha.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     },
      \     '**/__tests__/*-test.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     },
      \     'package.json&spec/javascripts/*': {
      \       'client/assets/javascripts/*.jsx': {
      \         'type': 'src',
      \         'alternate': 'spec/javascripts/{}-test.js'
      \       },
      \       'client/assets/javascripts/*.js': {
      \         'type': 'src',
      \         'alternate': 'spec/javascripts/{}-test.js'
      \       },
      \       'spec/javascripts/components/*-test.js': {
      \         'type': 'test',
      \         'alternate': 'client/assets/javascripts/components/{}.jsx'
      \       },
      \       'spec/javascripts/*-test.js': {
      \         'type': 'test',
      \         'alternate': 'client/assets/javascripts/{}.js'
      \       },
      \     },
      \     '*.py': {
      \       'alternate': 'tests/test_{basename}.py',
      \       'type': 'source'
      \     },
      \     'tests/test_*.py': {
      \       'alternate': '{}.py',
      \       'type': 'test'
      \     },
      \     'app/*.rb' : {
      \         'alternate': 'spec/{}_spec.rb',
      \          'type': 'app'
      \     },
      \     'lib/*.rb' : {
      \       'alternate': 'spec/{}_spec.rb',
      \       'type' : 'lib'
      \     },
      \     '*.go': {
      \       'alternate': '{}_test.go',
      \       'type': 'source'
      \     },
      \     '*_test.go': {
      \         'alternate': '{}.go',
      \         'type': 'test'
      \     },
      \   }
      \ }

let g:lengthmatters_on_by_default = 0

let g:braceless_generate_scripts = 1

" rspec folding
" let g:fold_rspec_foldenable = 1  " disables folding (toggle with `zi`)
let g:fold_rspec_foldlevel = 2       " sets initial open/closed state of all folds (open unless nested more than two levels deep)
" let g:fold_rspec_foldcolumn = 4      " shows a 4-character column on the lefthand side of the window displaying the document's fold structure
" let g:fold_rspec_foldclose = 'all'   " closes folds automatically when the cursor is moved out of them (only applies to folds deeper than 'foldlevel')
let g:fold_rspec_foldminlines = 3    " disables closing of folds containing two lines or fewer

" elixir
let g:alchemist_tag_map = '<leader>f'

" python
let g:impsort_textwidth = 1
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1

let g:python_host_prog = '/Users/jeff/.pyenv/versions/neovim2/bin/python2'
let g:python3_host_prog = '/Users/jeff/.pyenv/versions/neovim3/bin/python3'

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'handlebars' : 1,
    \ 'eruby' : 1,
    \}

let g:vinarise_enable_auto_detect=0

let g:vim_current_word#highlight_only_in_focused_window = 0
let g:vim_current_word#enabled = 0
