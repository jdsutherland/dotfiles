function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" TODO: try
" Plug 'metakirby5/codi.vim' " repl
" Plug 'pechorin/any-jump.vim'
" Plug 'liuchengxu/vista.vim' " replaces tagbar
" Plug 'liuchengxu/vim-which-key'
" Plug 'rhysd/git-messenger.vim'
" Plug 'RRethy/vim-hexokinase' see if this replaces vim-css-color - supposedly faster
" Plug 'pechorin/any-jump.vim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " vim browser textarea

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph'

" general
Plug 'AndrewRadev/linediff.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'dietsche/vim-lastplace'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/whitespaste.vim' " claims integrates with vim-pasta TODO: verify
Plug 'AndrewRadev/undoquit.vim'
Plug 'tommcdo/vim-exchange'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'diepm/vim-rest-console'
Plug 'rizzatti/dash.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'PeterRincker/vim-argumentative'
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_html_attributes_bracket_on_new_line = 1
Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"

" TODO: replace w/ coc-snippets
Plug 'SirVer/ultisnips' | Plug 'jdsutherland/vim-snippets'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-J>'
Plug 'epilande/vim-react-snippets'
Plug 'jhkersul/vim-jest-snippets'

Plug 'Valloric/ListToggle'
let g:toggle_list_no_mappings = 1
let g:lt_location_list_toggle_map = '\d'
let g:lt_quickfix_list_toggle_map = '\\'

Plug 'breuckelen/vim-resize'
let g:vim_resize_disable_auto_mappings = 1

Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'

Plug 'christoomey/vim-titlecase'
let g:titlecase_map_keys = 0

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 1

Plug 'christoomey/vim-quicklink'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key = '<M-u>'

Plug 'janko-m/vim-test'
let test#strategy = 'vtr'
let g:test#preserve_screen = 1
let g:test#go#gotest#options = '-v'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR = 1
let g:AutoPairsShortcutJump = ''

Plug 'junegunn/vim-easy-align'
let g:easy_align_delimiters = {
      \ '/': { 'pattern': '/[/*]/' },
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ }
Plug 'tommcdo/vim-lion'

" textobj {{{
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'jceb/vim-textobj-uri'
Plug 'reedes/vim-textobj-sentence'
Plug 'inside/vim-textobj-jsxattr'
Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript'
Plug 'machakann/vim-textobj-delimited'
" }}}

" tagbar {{{
" Plug 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_indent = 1
let g:tagbar_width = 35
let g:tagbar_expand = 1
let g:tagbar_map_previewwin= "O"
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0

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

Plug 'vasconcelloslf/vim-interestingwords'
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFAA02', '#FF7272', '#FFB3FF', '#9999FF']
Plug 'sunaku/vim-hicterm'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-scripts/BufOnly.vim'
Plug 'machakann/vim-sandwich'
Plug 'troydm/zoomwintab.vim'
Plug 'triglav/vim-visual-increment'
" TODO: keep?
Plug 'mattboehm/vim-unstack'
" TODO: keep?
Plug 'mattboehm/vim-accordion'
" TODO: keep?
Plug 'dhruvasagar/vim-table-mode'
Plug 'duff/vim-ddldbl'

" projectionist {{{
Plug 'tpope/vim-projectionist'
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
" }}}

" TODO: keep?
Plug 'vitalk/vim-simple-todo'
let g:simple_todo_map_keys = 0

Plug 'airblade/vim-rooter'
let g:rooter_manual_only = 1

Plug 'rhysd/clever-f.vim'
let g:clever_f_not_overwrites_standard_mappings=1

Plug 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1

" poppy - rainbow parens  {{{
Plug 'bounceme/poppy.vim'
augroup Poppy
  au!
augroup END
nnoremap <silent><c-p> :call clearmatches() \| let g:poppy = -get(g:,'poppy',-1) \|
      \ exe 'au! Poppy CursorMoved *' . (g:poppy > 0 ? ' call PoppyInit()' : '') <cr>
" }}}

" ranger.vim {{{
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
let g:ranger_map_keys = 0
" attempt to load directory with ranger.vim
augroup ranger
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Ranger' | endif
augroup END
fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
                \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu
" }}}

Plug 'inside/vim-grep-operator'
let g:grep_operator_set_search_register = 1
nmap ,G <Plug>GrepOperatorOnCurrentDirectory
vmap ,G <Plug>GrepOperatorOnCurrentDirectory
" TODO: keep?
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'wincent/loupe'
let g:LoupeHighlightGroup='Error'
Plug 'bronson/vim-visual-star-search'

" TODO: keep?
Plug 'ervandew/supertab'

" vim-better-whitespace {{{
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm = 0
let g:strip_max_file_size = 1000
let g:better_whitespace_guicolor='#cc6666'
" }}}

" TODO: keep?
" Plug 'djdt/pyparens.nvim', {do: ':UpdateRemotePlugins'}

" MatchTagAlways {{{
Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'handlebars' : 1,
    \ 'eruby' : 1,
    \}
" }}}

" TODO: keep?
Plug 'kassio/neoterm'

" limelight/goyo {{{
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
let g:goyo_width = 100
let g:goyo_height = 100
" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " Limelight
  " ...
endfunction
function! s:goyo_leave()
  silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  " set showmode
  set showcmd
  set scrolloff=3
  Limelight!
  " ...
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" writing {{{
Plug 'reedes/vim-pencil'
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-lexical'
Plug 'rhysd/vim-grammarous'
Plug 'Ron89/thesaurus_query.vim'
let g:grammarous#languagetool_cmd = 'languagetool'
" let g:lexical#thesaurus_key = '<c-s><c-t>'
let g:tq_mthesaur_file='~/.vim/spell/thesaurus/mthesaur.txt'
nnoremap <c-s><c-t> :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <c-s><c-t> y:ThesaurusQueryReplace <C-r>"<CR>
" }}}

" git
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
let g:diffget_local_map = ',dgl'
let g:diffget_upstream_map = ',dgu'
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_define_advanced_commands = 1
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'moll/vim-bbye'
Plug 'junegunn/vim-github-dashboard'
Plug 'gabebw/vim-github-link-opener', { 'branch': 'gbw-source-code-link' }
Plug 'christoomey/vim-quicklink'

" javascript {{{
Plug 'moll/vim-node'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'MaxMEllon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1
Plug 'pangloss/vim-javascript'
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "∅"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_equality       = "≡"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "∬"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
" }}}

" html/css
Plug 'ap/vim-css-color'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
let g:user_emmet_next_key = '<C-j>'
Plug 'othree/html5.vim'
Plug 'tpope/vim-jdaddy'
Plug 'hail2u/vim-css3-syntax'

" ruby {{{
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'christoomey/vim-rfactory'
Plug 'vim-ruby/vim-ruby'
let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1
let g:ruby_operators = 1
let g:ruby_minlines = 150
" TODO: keep?
" Plug 'rlue/vim-fold-rspec', { 'for': 'ruby' }
" let g:fold_rspec_foldlevel = 2 " init open/closed state of all folds (open unless nested < 2 levels deep)
" let g:fold_rspec_foldminlines = 3 " disables closing of folds containing <= 2 lines
" }}}

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_map = '<leader>f'

" python {{{
" TODO: keep?
Plug 'tweekmonster/braceless.vim' " Python vaP
let g:braceless_generate_scripts = 1
autocmd FileType python,haml,coffee BracelessEnable +indent +fold
autocmd FileType yaml,ruby BracelessEnable +fold
" TODO: keep?
" Plug 'vim-python/python-syntax', { 'for': ['python'] }
" let g:python_highlight_all = 1
" let g:python_highlight_file_headers_as_comments = 1
" Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
" let g:pymode_options = 0
" let g:pymode_folding = 1
" let g:pymode_doc_bind = ',K'
" let g:pymode_lint = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
" let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
" let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
" let g:jedi#rename_command = '<Leader>gR'
" let g:jedi#completions_enabled = 0
" let g:jedi#smart_auto_mappings = 1
" let g:jedi#documentation_command = '<Leader>_K'
" let g:jedi#auto_close_doc = 1
" Plug 'tweekmonster/impsort.vim', { 'for': ['python'] }
" let g:impsort_textwidth = 1
" }}}

" clojure
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" golang {{{
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
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
" Plug 'ivy/vim-ginkgo'
" }}}

" misc lang
Plug 'neovimhaskell/haskell-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'chr4/nginx.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'cespare/vim-toml'
Plug 'tmux-plugins/vim-tmux'
Plug 'justinmk/vim-syntax-extra' " improved c syntax

" vim styles {{{
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16_shell'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
" display root buffer/filename instead of full path
let g:airline_section_c = '%t'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_section_y = '' " hide [utf-8 unix]
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
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
let g:fzf_commits_log_options =
\ '--graph --color=always --format="%C(auto)%h%d %s %C(#373b41)%C(bold)%cr"'

" " TODO: verify below is better
" let g:rg_command = '
" \ rg --no-hidden --column --line-number --no-heading --fixed-strings --smart-case --follow --color "always"
" \ -g "!{.git,node_modules,vendor,build,plugged,dist,package-lock.json}"
" \ -g "*.{lua,js,ts,coffee,jsx,json,php,styl,jade,html,css,scss,config,py,cpp,c,cs,h,go,hs,rb,erb,conf,hbs,sh,sql,sol,java}" '
" " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   g:rg_command . shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:70%:hidden')
"   \           : fzf#vim#with_preview('right:50%', ';'),
"   \   <bang>0)

" TODO: verify this is better than above and uses .ignore file
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" :RG calls rg each onChange (rather than single search with fzf filtering onChange)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" let g:fzf_files_options =
"   \ '--preview "(bat --theme=TwoDark --color=always {}) 2> /dev/null"'

" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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

" }}}

" TODO: replace with codi.vim?
" rappel {{{
Plug 'Cypher1/nvim-rappel'
" let g:rappel#term       = 'vsp | term '
let g:rappel#term = ' VtrSendCommandToRunner cd $(dirname %:p) > /dev/null; echo;'
let g:rappel#launch  = 'chrome %'
let g:rappel#default = g:rappel#term
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
\   'repl': 'node --inspect --eval %:p',
\   'run': 'node %:p',
\   'launch': 'ndb %:p',
\ },
\ 'elixir': {
\   'repl': 'iex %:p',
\   'run': 'elixir %:p',
\ },
\}
" }}}

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
let g:vim_markdown_toc_autofit = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1

Plug 'rhysd/open-pdf.vim'
Plug 'chrisbra/csv.vim'
Plug 'AndrewRadev/exercism.vim'
Plug 'terryma/vim-expand-region'
Plug 'xavierchow/vim-sequence-diagram'
