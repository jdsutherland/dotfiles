function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" TODO try
Plug 'rlue/vim-fold-js'

Plug 'carakan/pmv.vim'
Plug 'zhimsel/vim-stay'
Plug 'Konfekt/FastFold'
Plug 'AndrewRadev/tagalong.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'OrangeT/vim-csharp'

" try
Plug 'sodapopcan/vim-twiggy'
Plug 'dbatten5/vim-macroscope', {'branch': 'main'}
Plug 'dkarter/bullets.vim' " markdown lists
let g:bullets_renumber_on_change = 0

Plug 'bergercookie/vim-debugstring'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " browser textarea

Plug 'Shougo/echodoc.vim'
" let g:echodoc#type = 'virtual'
" let g:echodoc#type = 'floating'
let g:echodoc_enable_at_startup = 1

Plug '907th/vim-auto-save'
let g:auto_save        = 0
let g:auto_save_silent = 1
" let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
let g:auto_save_events = ["CursorHold"]

" {{{ sideways.vim
Plug 'AndrewRadev/sideways.vim'
nnoremap <, :SidewaysLeft<cr>
nnoremap >, :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
nmap ,aa <Plug>SidewaysArgumentAppendAfter
nmap ,aj <Plug>SidewaysArgumentAppendLast
" uses rhysd/vim-textobj-anyblock to append str
" useful to append html attr (class etc)
nmap ,as vib<esc>a<space>
nmap ,ac vib<esc>a<space>class=""<left>
nmap s,i <Plug>SidewaysArgumentInsertBefore
nmap s,a <Plug>SidewaysArgumentAppendAfter
nmap s,I <Plug>SidewaysArgumentInsertFirst
nmap s,A <Plug>SidewaysArgumentAppendLast
" }}}

" {{{ vista
Plug 'liuchengxu/vista.vim' " replaces tagbar
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = ['coc', 'ctags']
let g:vista_stay_on_open = 0
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_keep_fzf_colors = 1
let g:vista_sidebar_width = 50
" let g:vista_keep_fzf_colors = 1
" use ctags here?
nnoremap <silent> <space>o :Vista finder coc<CR>
nnoremap <silent> <space>O :Vista finder ctags<CR>
nnoremap <silent> <M-z> :Vista!!<CR>
" }}}

" TODO: keep?
" " tagbar {{{
" Plug 'majutsushi/tagbar'
" " tagbar
" nnoremap <silent> <M-z> :TagbarToggle<CR>
" nnoremap <silent> ,zz :TagbarOpen fj<CR>
" " tagbar
" nnoremap <silent> <M-z> :TagbarToggle<CR>
" nnoremap <silent> ,zz :TagbarOpen fj<CR>
" nnoremap <silent> ,zx :TagbarTogglePause<CR>
" let g:tagbar_compact = 1
" let g:tagbar_zoomwidth = 0
" let g:tagbar_indent = 1
" let g:tagbar_width = 35
" let g:tagbar_expand = 1
" let g:tagbar_map_previewwin= "O"
" let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_sort = 0

" let g:tagbar_type_css = {
" \ 'ctagstype' : 'Css',
"     \ 'kinds'     : [
"         \ 'c:classes',
"         \ 's:selectors',
"         \ 'i:identities'
"     \ ]
" \ }
" let g:tagbar_type_elixir = {
"     \ 'ctagstype' : 'elixir',
"    \ 'kinds' : [
"         \ 'f:functions',
"         \ 'functions:functions',
"         \ 'c:callbacks',
"         \ 'd:delegates',
"         \ 'e:exceptions',
"         \ 'i:implementations',
"         \ 'a:macros',
"         \ 'o:operators',
"         \ 'm:modules',
"         \ 'p:protocols',
"         \ 'r:records',
"         \ 't:tests'
"     \ ]
" \ }
" let g:tagbar_type_go = {
"   \ 'ctagstype' : 'go',
"   \ 'kinds'     : [
"     \ 'p:package',
"     \ 'i:imports:1',
"     \ 'c:constants',
"     \ 'v:variables',
"     \ 't:types',
"     \ 'n:interfaces',
"     \ 'w:fields',
"     \ 'e:embedded',
"     \ 'm:methods',
"     \ 'r:constructor',
"     \ 'f:functions'
"   \ ],
"   \ 'sro' : '.',
"   \ 'kind2scope' : {
"     \ 't' : 'ctype',
"     \ 'n' : 'ntype'
"   \ },
"   \ 'scope2kind' : {
"     \ 'ctype' : 't',
"     \ 'ntype' : 'n'
"   \ },
"   \ 'ctagsbin'  : 'gotags',
"   \ 'ctagsargs' : '-sort -silent'
" \ }
" let g:tagbar_type_make = {
"             \ 'kinds':[
"                 \ 'm:macros',
"                 \ 't:targets'
"             \ ]
" \}
" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"         \ 'h:Heading_L1',
"         \ 'i:Heading_L2',
"         \ 'k:Heading_L3'
"     \ ]
" \ }
" }}}

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'javascriptreact', 'typescript.tsx', 'typescriptreact', 'eruby', 'scss', 'sass']
let g:Hexokinase_highlighters = ['backgroundfull']

" {{{ CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
hi! CocHintSign guifg=#969896
let g:coc_disable_transparent_cursor = 1
Plug 'antoinemadec/coc-fzf'
let g:coc_fzf_preview= 'right:50%'
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-snippets',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-elixir',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-svg',
  \ 'coc-actions',
  \ 'coc-lists',
  \ 'coc-solargraph',
  \ 'coc-yank',
  \ 'coc-sh',
  \ 'coc-jest',
  \ 'coc-emmet',
  \ 'coc-clangd',
  \ 'coc-react-refactor',
  \ 'coc-sql',
  \ 'coc-db',
  \ ]
 let g:coc_filetype_map = {
 \ 'yaml.ansible': 'yaml',
 \ 'yaml.docker-compose': 'yaml',
 \ 'yaml.eruby': 'yaml',
 \ }
nnoremap ,sS :CocList -A snippets<cr>
nnoremap ,SS :CocFzfList snippets<cr>
nnoremap <silent> ,ss :CocCommand snippets.editSnippets<cr>

" nnoremap <silent> <space>p :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <space>p :<C-u>CocFzfList yank<cr>

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/stylelint')
  let g:coc_global_extensions += ['coc-stylelintplus']
endif

function! s:check_eslint()
  if !isdirectory('./node_modules') || !isdirectory('./node_modules/eslint')
    call coc#config('eslint', {
    \ 'enable': v:false,
    \ })
  endif
endfunction
autocmd BufEnter *.{js,jsx,ts,tsx} :call <SID>check_eslint()

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" TODO: keep?
inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" TODO: verify - emmet-move-prev doesn't seem to work
" imap <expr> <c-j> pumvisible() ? '<C-n>' : '<plug>(emmet-move-next)'
" imap <expr> <c-k> pumvisible() ? '<C-p>' : '<plug>(emmet-move-prev)'
" Use <C-j> for select text for visual placeholder of snippet.
vmap <tab> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <c-f>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<c-f>" :
      \ coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" TODO: broke <cr>g map
" Remap keys for gotos
nmap <silent> <cr>gd <Plug>(coc-definition)
nmap <silent> <cr>gt <Plug>(coc-declaration)
nmap <silent> <cr>gy <Plug>(coc-type-definition)
nmap <silent> <cr>gi <Plug>(coc-implementation)
nmap <silent> <cr>gr <Plug>(coc-references)

" show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    if (CocHasProvider('hover'))
      call CocAction('doHover')
    endif
  endif
endfunction
nnoremap <silent> <space><space> :call <SID>show_documentation()<CR>

" common editor actions
nmap <leader>rn <Plug>(coc-rename)
" xmap <tab>f <Plug>(coc-format-selected)
" nmap <tab>f <Plug>(coc-format-selected)
nmap <leader>do <Plug>(coc-codeaction)
nmap <space>F <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>f <Plug>(coc-fix-current)
nmap <leader>dc <Plug>(coc-codelens-action)
nmap \F <Plug>(coc-format)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics
nnoremap <silent> <tab>d :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <tab>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <tab>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <tab>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <tab>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <tab>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <tab>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <tab>p :<C-u>CocListResume<CR>

nnoremap <space>C :cclose<cr>:pclose<cr>:call coc#util#float_hide()<cr>
nnoremap <space>R :silent CocRestart<cr>
" }}}

" general
Plug 'AndrewRadev/linediff.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'dietsche/vim-lastplace'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'tommcdo/vim-exchange'
Plug 'wesQ3/vim-windowswap'
Plug 'flw-cn/vim-markdown'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " change if https://github.com/turbio/bracey.vim/pull/56 not merged
Plug 'mogelbrod/vim-jsonpath'
Plug 'nathanaelkane/vim-indent-guides'
nnoremap <tab>i :IndentGuidesToggle<cr>
Plug 'markonm/traces.vim'
Plug 'tpope/vim-apathy'
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
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'diepm/vim-rest-console'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'sunaku/vim-hicterm'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vim-scripts/BufOnly.vim'
Plug 'machakann/vim-sandwich'
let g:textobj_sandwich_no_default_key_mappings = 1
Plug 'triglav/vim-visual-increment'
Plug 'mattboehm/vim-unstack'
nnoremap <space>= :UnstackFromClipboard<cr>
Plug 'mattboehm/vim-accordion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'duff/vim-ddldbl'
Plug 'rbgrouleff/bclose.vim'

Plug 'rizzatti/dash.vim'
nnoremap gk :Dash<CR>
" hacky way to lookup dot chain native modules easily in Dash
map <cr>k viwf.ey;Dash <C-R>"<CR>

Plug 'troydm/zoomwintab.vim'
nnoremap <silent><cr>z :ZoomWinTabToggle<CR>
nnoremap <silent>M :ZoomWinTabToggle<CR>


Plug 'tpope/vim-abolish'
nnoremap <Leader>abs :%S/
nnoremap <Leader>abb :%S// **/*<left><left><left><left><left><left>

Plug 'tpope/vim-characterize'
nmap <cr><space><space> <Plug>(characterize)

" vim-surround {{{
Plug 'tpope/vim-surround'
" surround a word w function
nmap <CR>f saiwf

" x Surround jsx
autocmd FileType javascriptreact,typescriptreact,typescript.tsx let b:surround_120 = "<\r />"
autocmd FileType javascriptreact,typescriptreact,typescript.tsx nmap ,X ysiwxe

" ,# Surround a word with #{ruby interpolation}
nmap ,# ysiw}i#<esc>E
vmap ,# c#{<C-R>"}<ESC>

" ,$ Surround a word with ${js interpolation}
nmap ,$ ysiw}i$<esc>E
vmap ,$ c${<C-R>"}<ESC>

" ," Surround a word with "quotes"
nmap ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
nmap ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
nmap ,( ysiw(
nmap ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
nmap ,] ysiw]
nmap ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
nmap ,} ysiw}
nmap ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

nmap ,` ysiw`
nmap ,<space> ysiw<space><space>
" }}}

" {{{ splitjoin
Plug 'AndrewRadev/splitjoin.vim'
nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>
let g:splitjoin_html_attributes_bracket_on_new_line = 1
" }}}

Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"

Plug 'FooSoft/vim-argwrap'
nmap <silent> <leader>a <Plug>(ArgWrapToggle)

" {{{ resize
Plug 'breuckelen/vim-resize'
let g:vim_resize_disable_auto_mappings = 1
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>
" }}}

" vim-tmux-runner {{{
Plug 'christoomey/vim-tmux-runner'
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 1
nnoremap <cr>q :VtrSendCommandToRunner<space>
" nnoremap <leader>sr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
nnoremap <leader>or :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<cr>
nnoremap <leader>nr :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'node'}<cr>
nnoremap <leader>sd :VtrSendCtrlD<cr>
nnoremap <leader>sc :VtrSendCtrlC<cr>
nnoremap <leader>sk :VtrSendKeysRaw <cr>
nnoremap <leader>sf :VtrSendFile<cr>
nnoremap <space>- :VtrAttachToPane<cr>
let g:VtrClearBeforeSend = 0
" send everything
" nmap ,sL vae<leader>sl
" " nmap <CR>f gv<leader>sl TODO: new map
vmap <CR>f ,sl
" " useful resending sql
nmap <cr>F vap,sl
" " TODO: send textobj-chunk to runner
" nmap <cr>c vac<leader>sl
"
" }}}

" {{{ easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key = '<M-u>'
nmap <space>w <M-u>w
nmap <space>b <M-u>b
nmap <space>e <M-u>e
" nmap <space>f <M-u>f
nmap <space>k <M-u>k
nmap <space>j <M-u>j
" }}}

" {{{ vim-test
Plug 'janko-m/vim-test'
let test#strategy = 'vtr'
let g:test#preserve_screen = 1
let g:test#go#gotest#options = '-v'
nnoremap <silent> <space>tt :TestNearest<CR>
nnoremap <silent> <space>ts :TestSuite<CR>
nnoremap <silent> <space>tf :TestFile<CR>
nnoremap <silent> <space>tl :TestLast<CR>
nnoremap <silent> <space>tv :vsp<CR>:exec ':TestVisit'<CR>
" }}}

" {{{ auto-pairs
Plug 'jiangmiao/auto-pairs'
" disable in markdown
au Filetype markdown let b:autopairs_loaded=1
let g:AutoPairsShortcutJump = ''
" }}}

" {{{ easy-align
Plug 'junegunn/vim-easy-align'
let g:easy_align_delimiters = {
      \ '/': { 'pattern': '/[/*]/' },
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ }
" EasyAlign
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" align inner indent
nmap <cr>i viiga<space>
" sort inner indent
nmap <cr>s viigs
" hack to sort and align current indent (useful css)
nmap <cr>is viiga<space>gvgs
" }}}

Plug 'tommcdo/vim-lion'

" textobj {{{
Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
Plug 'michaeljsmith/vim-indent-object' " want to delete indent following current line (like `di)`): try this
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
" Plug 'nelstrom/vim-textobj-rubyblock' "TODO: slow
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'reedes/vim-textobj-sentence'
Plug 'inside/vim-textobj-jsxattr'
Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript'
Plug 'machakann/vim-textobj-delimited'
Plug 'rhysd/vim-textobj-anyblock'
" }}}

" {{{ interesting words
Plug 'vasconcelloslf/vim-interestingwords'
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsGUIColors = ['#9999FF', '#FFB3FF', '#FF7272', '#FFAA02', '#FFD65C', '#99FFB3', '#A8957E', '#FFF6CC']
nnoremap <silent> <space>h :call InterestingWords('n')<cr>
nnoremap <silent> <space>H :call UncolorAllWords()<cr>
" }}}

Plug 'gennaro-tedesco/nvim-peekup'

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
      \     'index.html': {
      \       'alternate': 'style.css',
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

Plug 'airblade/vim-rooter'
let g:rooter_manual_only = 1

" {{{ clever-f
Plug 'rhysd/clever-f.vim'
let g:clever_f_not_overwrites_standard_mappings=1
nmap f <Plug>(clever-f-f)
xmap f <Plug>(clever-f-f)
omap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)
xmap F <Plug>(clever-f-F)
omap F <Plug>(clever-f-F)
" }}}

Plug 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1
nnoremap <silent> ,u :UndotreeToggle<CR>

" poppy - rainbow parens  {{{
Plug 'bounceme/poppy.vim'
augroup Poppy
  au!
augroup END
nnoremap <silent><c-p> :call clearmatches() \| let g:poppy = -get(g:,'poppy',-1) \|
      \ exe 'au! Poppy CursorMoved *' . (g:poppy > 0 ? ' call PoppyInit()' : '') <cr>
" }}}

" {{{ grepper
Plug 'mhinz/vim-grepper'
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.prompt_quote = 3
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg = { 'grepprg': 'rg --no-heading --vimgrep --smart-case' }
nmap <leader>m <plug>(GrepperOperator)
xmap <leader>m <plug>(GrepperOperator)
" }}}

Plug 'romainl/vim-qf'
let g:qf_mapping_ack_style = 1
nmap <silent> \\ <Plug>(qf_qf_toggle)
nmap <silent> \d <Plug>(qf_loc_toggle)
Plug 'romainl/vim-qlist' " persist [I to qflist
Plug 'stefandtw/quickfix-reflector.vim'
let g:qf_join_changes = 1
Plug 'wincent/loupe'

" vim-better-whitespace {{{
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm = 0
let g:better_whitespace_guicolor='#cc6666'
" }}}

" limelight/goyo {{{
Plug 'junegunn/limelight.vim'
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
nnoremap <silent><space>L :Limelight!!<cr>
Plug 'junegunn/goyo.vim'
nnoremap <space>2 :Goyo<cr>
let g:goyo_width = '100%'
let g:goyo_height = '100%'
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
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 120
Plug 'dbmrq/vim-ditto'
nmap +d <Plug>DittoGood
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-lexical'
Plug 'rhysd/vim-grammarous'
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction
let g:grammarous#languagetool_cmd = 'languagetool'
Plug 'jdsutherland/fzf-wordnet.vim'
imap <c-s><c-d> <Plug>(fzf-complete-wordnet)
Plug 'Ron89/thesaurus_query.vim'
let g:tq_mthesaur_file='~/.vim/spell/thesaurus/mthesaur.txt'
nnoremap <c-s><c-t> :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <c-s><c-t> y:ThesaurusQueryReplace <C-r>"<CR>
" }}}

" git
Plug 'airblade/vim-gitgutter'

" gutentags {{{
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_define_advanced_commands = 1
" workaround https://github.com/ludovicchabant/vim-gutentags/issues/178
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]
" }}}

" {{{ fugitive
Plug 'tpope/vim-fugitive'
nnoremap <space>ga :Git add %<CR>
nnoremap <space>gA :Git add .<CR>
nnoremap <space>gc :tab Git commit -v -q<CR>
nnoremap <space>gt :vert Git commit -v -q %:p<CR>
nnoremap <space>gb :Git blame<CR>
nnoremap <space>gB :GBrowse<CR>
nnoremap <space>gp :vert Git add --patch<CR>
nnoremap <space>ge :Gedit!<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! 0Glog<CR>
nnoremap <space>gL :GitLog<space>
nnoremap <space>gP :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gbr :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dp :diffput<space>
nnoremap <leader>dg :diffget<space>
" }}}

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-rhubarb'

Plug 'moll/vim-bbye'
nnoremap <silent> <space>dd :Bdelete<CR>

Plug 'junegunn/vim-github-dashboard'
Plug 'gabebw/vim-github-link-opener', { 'branch': 'gbw-source-code-link' }
Plug 'christoomey/vim-quicklink' " broken as of 2017 due to google api change
Plug 'rhysd/git-messenger.vim'
nmap <space>m <Plug>(git-messenger)
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_date_format = "%Y %b %d %X"

" javascript {{{
Plug 'moll/vim-node'
Plug 'jparise/vim-graphql'

Plug 'leafgarland/typescript-vim'
" https://github.com/leafgarland/typescript-vim/issues/184
hi link typescriptReserved Keyword

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

Plug 'jhkersul/vim-jest-snippets'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
" }}}

" {{{ sideways.vim
Plug 'AndrewRadev/sideways.vim'
nnoremap <, :SidewaysLeft<cr>
nnoremap >, :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
nmap ,aa <Plug>SidewaysArgumentAppendAfter
nmap ,aj <Plug>SidewaysArgumentAppendLast
" uses rhysd/vim-textobj-anyblock to append str
" useful to append html attr (class etc)
nmap ,as vib<esc>a<space>
nmap ,ac vib<esc>a<space>class=""<left>
nmap s,i <Plug>SidewaysArgumentInsertBefore
nmap s,a <Plug>SidewaysArgumentAppendAfter
nmap s,I <Plug>SidewaysArgumentInsertFirst
nmap s,A <Plug>SidewaysArgumentAppendLast
" }}}

Plug 'mattn/emmet-vim'
let g:user_emmet_next_key = '<C-j>'
imap <c-y><c-y> <Plug>(emmet-expand-abbr)

Plug 'othree/html5.vim'
Plug 'tpope/vim-jdaddy'
Plug 'elzr/vim-json'

" ruby {{{
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'christoomey/vim-rfactory'
Plug 'vim-ruby/vim-ruby'
let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1
let g:ruby_operators = 1
let g:ruby_minlines = 150
" TODO: keep?
Plug 'rlue/vim-fold-rspec', { 'for': 'ruby' }
let g:fold_rspec_foldlevel = 2 " init open/closed state of all folds (open unless nested < 2 levels deep)
let g:fold_rspec_foldminlines = 3 " disables closing of folds containing <= 2 lines
let g:fold_rspec_foldclose = 'all'       " closes folds automatically when the cursor is moved out of them (only applies to folds deeper than 'foldlevel')
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
autocmd FileType yaml BracelessEnable +fold

" {{{ clojure
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
" }}}

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
Plug 'ekalinin/Dockerfile.vim'
Plug 'kkvh/vim-docker-tools'

Plug 'chriskempson/base16-vim'

Plug 'jdsutherland/lualine.nvim'
let g:lualine = {
    \'options' : {
    \  'theme' : 'base16_tomorrow_night',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'disabled_filetypes' : [],
    \  'icons_enabled' : v:false,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:false,},], ],
    \  'lualine_x' : [ 'filetype' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [ 'ConflictedVersion' ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ 'fzf', 'fugitive' ],
    \}

" " airline {{{
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='base16_shell'
" " let g:airline_highlighting_cache = 1
" let g:airline_powerline_fonts = 1
" let g:airline_detect_modified=1
" let g:airline_detect_paste=1
" " display root buffer/filename instead of full path
" let g:airline_section_c = '%t'
" let g:airline_section_y = '%{ConflictedVersion()}' " vim-conflicted
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#vista#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#coc#enabled = 0
" let g:airline#extensions#coc#error_symbol = '!!'
" let g:airline#extensions#coc#warning_symbol = '!'
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" " }}}

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <silent> \t :call fzf#vim#buffers()<cr>
nnoremap <silent> \T :FzfBuffers<CR>
nnoremap <M-w> :FzfWindows<CR>
noremap ,bl :execute "FzfBLinesPreview '<c-r><c-w>"<cr>
noremap ,bL :execute "FzfLines '<c-r><c-w>"<cr>
nnoremap <silent> ,o :FzfBTags<CR>
nnoremap <silent> ,O :FzfTags<CR>
nnoremap <silent> ,mm :FzfMarks<CR>
nnoremap <silent> ,ht :FzfHelptags<CR>
nnoremap <silent> ,h/ :FzfHistory/<CR>
nnoremap <silent> ,h; :FzfHistory:<CR>
nnoremap <silent> ,/ :FzfHistory/<CR>
nnoremap <silent> ,? :FzfHistory<CR>
nnoremap <silent> ,gl :FzfCommits<CR>
nnoremap <silent> ,ga :FzfBCommits<CR>
nnoremap <silent> ,gs :FzfGFiles?<CR>
nnoremap <silent> K :call SearchWordWithRg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>

imap <c-s><c-k> <plug>(fzf-complete-word)
imap <c-s><c-f> <plug>(fzf-complete-path)
imap <c-s><c-j> <plug>(fzf-complete-file-ag)
imap <c-s><c-l> <plug>(fzf-complete-line)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-g': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-u': '15split',
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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! SearchWordWithRg()
  let l:word = expand('<cword>')
  execute 'Rg' l:word
endfunction

function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

function! GetJumps()
  redir => cout
  silent jumps
  redir END
  return reverse(split(cout, "\n")[1:])
endfunction
function! GoToJump(jump)
    let jumpnumber = split(a:jump, '\s\+')[0]
    execute "normal " . jumpnumber . "\<c-o>"
endfunction
command! Jumps call fzf#run(fzf#wrap({
        \ 'source': GetJumps(),
        \ 'sink': function('GoToJump')}))

" :RG calls rg each onChange (rather than single search with fzf filtering onChange)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --ignore-file ~/.ignore --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" fzf mru files
command! FzfMru call fzf#run({
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

command! -bang -nargs=* FzfBLinesPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

" }}}

Plug 'thinca/vim-quickrun'
nnoremap <space>rq :w<cr>:QuickRun<CR>

" rappel {{{
Plug 'Cypher1/nvim-rappel'
nnoremap <space>re :w<cr>:RappelRepl<CR>
nnoremap <space>rr :w<cr>:RappelRun<CR>
nnoremap <space>rl :w<cr>:RappelLaunch<CR>
" let g:rappel#term       = 'vsp | term '
let g:rappel#term = ' VtrSendCommandToRunner cd $(dirname %:p) > /dev/null; echo;'
let g:rappel#launch  = 'chrome %'
let g:rappel#default = g:rappel#term
let g:rappel#custom_repls = {
\ 'ruby': {
\   'repl': 'pry %:p',
\   'run': 'ruby %:p',
\ },
\ 'elixir': {
\   'repl': 'iex %:p',
\   'run': 'elixir %:p',
\ },
\ 'go': {
\   'run': 'go run %:p',
\ },
\ 'java': {
\   'compiler': 'javac %',
\   'run': 'java %',
\ },
\ 'cs': {
\   'run': 'dotnet run',
\   'repl': 'dotnet build',
\ },
\ 'python': {
\   'launch': 'pytest %:p',
\   'run': 'python %:p',
\ },
\}
" }}}

Plug 'godlygeek/tabular'

" {{{ mark
" TODO: mark colors
Plug 'inkarkat/vim-mark' | Plug 'inkarkat/vim-ingo-library'
let g:mw_no_mappings = 1
let g:mwDefaultHighlightingPalette = 'maximum'
nmap <space>I <Plug>MarkSet
" }}}

Plug 'rhysd/open-pdf.vim'
Plug 'chrisbra/csv.vim'

Plug 'AndrewRadev/exercism.vim'
cnoreabbrev exercism Exercism
cnoreabbrev exercism Exercism
