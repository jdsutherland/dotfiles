function! DoRemote(arg)
  UpdateRemotePlugins
endfunction


Plug 'lewis6991/gitsigns.nvim'

" colors
Plug 'rebelot/kanagawa.nvim'
Plug 'yazeed1s/oh-lucy.nvim'
Plug 'kvrohit/mellow.nvim'
Plug 'olivercederborg/poimandres.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }

Plug 'Einenlum/yaml-revealer'

Plug 'vim-scripts/applescript.vim'
Plug 'lpinilla/vim-codepainter'
Plug 'pwntester/octo.nvim'
Plug 'kentaroi/ultisnips-swift'

Plug 'arthurxavierx/vim-caser'
let g:caser_prefix = 'gS'
" preview tags
Plug 'skywind3000/vim-preview'
nnoremap <space>( :PreviewTag<cr>
noremap <c-n> :PreviewScroll +1<cr>
noremap <c-p> :PreviewScroll -1<cr>
Plug 'tweekmonster/startuptime.vim'
Plug 'sk1418/Join'
Plug 'junegunn/vader.vim'

" {{{ lua plugins
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'aserowy/tmux.nvim'
nnoremap <silent> <left>  <cmd>lua require('tmux').resize_left()<cr>
nnoremap <silent> <down>  <cmd>lua require('tmux').resize_bottom()<cr>
nnoremap <silent> <up>    <cmd>lua require('tmux').resize_top()<cr>
nnoremap <silent> <right> <cmd>lua require('tmux').resize_right()<cr>
Plug 'nvim-telescope/telescope.nvim'
nnoremap \ff <cmd>Telescope find_files<cr>
nnoremap \fg <cmd>Telescope live_grep<cr>
nnoremap \ft <cmd>Telescope buffers<cr>
nnoremap \fh <cmd>Telescope help_tags<cr>
nnoremap \fb <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap \fq <cmd>Telescope quickfix<cr>
" highlight cword, open exact uses
nmap <silent><space>sd [I ;let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr> ;Telescope quickfix<cr>
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
nnoremap \fp <cmd>Telescope project<cr>
Plug 'nvim-telescope/telescope-github.nvim'
nnoremap \fgi <cmd>Telescope gh issues<cr>
nnoremap \fgp <cmd>Telescope gh pull_request<cr>
nnoremap \fgg <cmd>Telescope gh gist<cr>
" nnoremap \fF <cmd>Telescope run<cr>
Plug 'Pocco81/AutoSave.nvim'
nnoremap <c-s> :ASToggle<cr>
Plug 'norcalli/nvim-colorizer.lua'

" {{{ UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Asheq/close-buffers.vim' " :Bdelete
nnoremap <silent> <space>bh :Bdelete! hidden<CR> :BufferOrderByWindowNumber<CR>
Plug 'romgrk/barbar.nvim'
nnoremap <silent> <space>bb :BufferOrderByWindowNumber<CR>
nnoremap <silent> <space>dd :BufferClose!<CR>
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/zen-mode.nvim'
" }}}

" }}}

" {{{ vim-stay
Plug 'zhimsel/vim-stay'
" HACK: https://github.com/zhimsel/vim-stay/issues/10 - fixes unexpected lcd
augroup stay_no_lcd
  autocmd!
  if exists(':tcd') == 2
    autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | exe 'cd '.fnameescape(getcwd(-1, -1)) | endif
  else
    autocmd User BufStaySavePre  if haslocaldir() | let w:lcd = getcwd() | cd - | cd - | endif
  endif
  autocmd User BufStaySavePost if exists('w:lcd') | execute 'lcd' fnameescape(w:lcd) | unlet w:lcd | endif
augroup END
" }}}

Plug 'carakan/pmv.vim' " packages
Plug 'Konfekt/FastFold'
Plug 'dbatten5/vim-macroscope', {'branch': 'main'}
Plug 'dkarter/bullets.vim' " markdown lists
let g:bullets_renumber_on_change = 0
Plug 'bergercookie/vim-debugstring'

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
let g:vista_finder_alternative_executives = ['ctags']
let g:vista_stay_on_open = 0
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_keep_fzf_colors = 1
let g:vista_sidebar_width = 50
" let g:vista_keep_fzf_colors = 1
" use ctags here?
nnoremap <silent> <space>O :silent Vista finder ctags<CR>
nnoremap <silent> \z :Vista!!<CR>
" }}}

Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'AndrewRadev/exercism.vim'
cnoreabbrev exercism Exercism
Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"
Plug 'pbrisbin/vim-mkdir'
Plug 'dietsche/vim-lastplace'
Plug 'vim-scripts/ReplaceWithRegister'
nmap ,gr "*gr
map <cr>g griw
map <cr>G gr$
Plug 'wellle/targets.vim'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-exchange'
Plug 'wesQ3/vim-windowswap'
Plug 'flw-cn/vim-markdown'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " change if https://github.com/turbio/bracey.vim/pull/56 not merged
Plug 'mogelbrod/vim-jsonpath'
Plug 'nathanaelkane/vim-indent-guides'
nnoremap <tab>i :IndentGuidesToggle<cr>
Plug 'markonm/traces.vim'
let g:traces_preview_window = "winwidth('%') > 160 ? 'bot vnew' : 'bot 10new'"
let g:traces_abolish_integration = 1
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-classpath'
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
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'diepm/vim-rest-console'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-titlecase'
nmap <cr>t gtiw
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'machakann/vim-sandwich'
let g:textobj_sandwich_no_default_key_mappings = 1
Plug 'triglav/vim-visual-increment'
Plug 'mattboehm/vim-unstack'
nnoremap <space>= :UnstackFromClipboard<cr>
Plug 'mattboehm/vim-accordion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'duff/vim-ddldbl'
Plug 'rbgrouleff/bclose.vim'
Plug 'troydm/zoomwintab.vim'

Plug 'rizzatti/dash.vim'
nnoremap gk :Dash<CR>
" hacky way to lookup dot chain native modules easily in Dash
map <cr>k viwf.ey;Dash <C-R>"<CR>

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

Plug 'FooSoft/vim-argwrap'
nmap <silent> <leader>a <Plug>(ArgWrapToggle)

" vim-tmux-runner {{{
Plug 'christoomey/vim-tmux-runner'
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 1
let g:VtrClearBeforeSend = 0
" press enter to repeat last cmd
nnoremap \v :VtrSendCommandToRunner<space>
nnoremap \vv :w<cr>:VtrSendCommandToRunner<cr>
" shortcut to mapping a temp runner with
nnoremap \vb :nnoremap ,t :VtrSendCommandToRunner<space>
nnoremap \vo :VtrOpenRunner<cr>
" cd to current buffer's root (FindRootDirectory from vim-rooter)
nnoremap \vr :execute 'VtrSendCommandToRunner cd ' FindRootDirectory()<CR>
nnoremap \vq :VtrKillRunner<cr>
nnoremap \vd :VtrSendCtrlD<cr>
nnoremap \vc :VtrSendCtrlC<cr>
nnoremap \vf :VtrSendFile<cr>
nnoremap \va :VtrAttachToPane<cr>
" on startup, attach to pane below
autocmd VimEnter * if !system("tmux display-message -p '#{pane_at_bottom}'") | execute 'VtrAttachToPane' system('tmux display -p -t "{down-of}" "#{pane_index}"')
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
" runs test in term, auto search for error location
" @q macro mimics vim-unstack
function! TestCustom(test_cmd)
  execute 'tabnew'
  call termopen(a:test_cmd)
  " HACK: <CR> seems to trigger tmux move (?) so followed by <M-B> (tmux prev pane) to return
  sleep 100m
  let file_with_err_at_line = "\.[a-z]{1,4}\\:\\d+"
  " NOTE: always 'Pattern not found' though it works...
  call feedkeys("/".file_with_err_at_line."\<CR>")
  " macro to open files (vert gF) from stacktrace
  let @q="nlzz:execute 'match Error /\\%'.line('.').'l/'\<CR>b\\1"
endfunction
command! -nargs=+ TestCustom :call TestCustom(<q-args>)

let test#custom_strategies = {'custom': function('TestCustom')}
let test#strategy = 'vtr'
let g:test#preserve_screen = 1
" let g:test#go#gotest#options = '-v'
nnoremap <silent> <space>tt :TestNearest<CR>
nnoremap <silent> <space>tT :TestLast -strategy=custom<cr>
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

Plug 'tommcdo/vim-lion'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" textobj {{{
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
" Plug 'kana/vim-textobj-indent'
Plug 'michaeljsmith/vim-indent-object' " want to delete indent following current line (like `di)`): try this
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'reedes/vim-textobj-sentence'
Plug 'inside/vim-textobj-jsxattr'
Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript'
Plug 'machakann/vim-textobj-delimited' " d
Plug 'rhysd/vim-textobj-anyblock'      " b
Plug 'rhysd/vim-textobj-ruby'          " r
let g:textobj_ruby_more_mappings = 1 " ro, rl, rc, rd, rr
" }}}

" {{{ interesting words
Plug 'vasconcelloslf/vim-interestingwords'
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsGUIColors = ['#9999FF', '#FFB3FF', '#FF7272', '#FFAA02', '#FFD65C', '#99FFB3', '#A8957E', '#FFF6CC']
nnoremap <silent> <space>h :call InterestingWords('n')<cr>
nnoremap <silent> <space>H :call UncolorAllWords()<cr>
" }}}

" {{{ mark
" TODO: mark colors
Plug 'inkarkat/vim-mark' | Plug 'inkarkat/vim-ingo-library'
let g:mw_no_mappings = 1
let g:mwDefaultHighlightingPalette = 'maximum'
nmap <space>I <Plug>MarkSet
" }}}

Plug 'junegunn/vim-peekaboo'

" projectionist {{{
Plug 'tpope/vim-projectionist'
nnoremap <cr>aa :AV<cr>
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
nnoremap <silent>\P :call clearmatches() \| let g:poppy = -get(g:,'poppy',-1) \|
      \ exe 'au! Poppy CursorMoved *' . (g:poppy > 0 ? ' call PoppyInit()' : '') <cr>
" }}}

" {{{ vim-grepper (async)
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
nmap <silent> \q <Plug>(qf_qf_toggle)
nmap <silent> \l <Plug>(qf_loc_toggle)
Plug 'romainl/vim-qlist' " persist [I to qflist
Plug 'stefandtw/quickfix-reflector.vim'
let g:qf_join_changes = 1
Plug 'wincent/loupe'

" vim-better-whitespace {{{
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm = 0
let g:better_whitespace_guicolor='#cc6666'
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'git']
" }}}

" limelight/goyo {{{
Plug 'junegunn/limelight.vim'
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
nnoremap <silent><space>L :Limelight!!<cr>

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

" {{{ vim-pencil advanced init
function! Prose()
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  " call textobj#quote#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  " setlocal foldlevel=6

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
endfunction

" automatically initialize buffer by file type
" autocmd FileType markdown,mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
" }}}
" }}}

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
Plug 'tpope/vim-fugitive' | Plug 'rbong/vim-flog'
nnoremap <space>ga :Git add %<CR>
nnoremap <space>gA :Git add .<CR>
nnoremap <space>gc :tab Git commit -v -q<CR>
nnoremap <space>gt :vert Git commit -v -q %:p<CR>
nnoremap <space>gb :Git blame<CR><c-w><c-p>
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

Plug 'junegunn/vim-github-dashboard'
Plug 'jdsutherland/vim-github-link-opener'
Plug 'christoomey/vim-quicklink' " broken as of 2017 due to google api change
Plug 'rhysd/git-messenger.vim'
let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:false
nmap <space>m <Plug>(git-messenger)
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_date_format = "%Y %b %d %X"

" javascript {{{
Plug 'jparise/vim-graphql'
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

Plug 'tpope/vim-jdaddy'

" ruby {{{
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'christoomey/vim-rfactory'
Plug 'rlue/vim-fold-rspec', { 'for': 'ruby' }
let g:fold_rspec_foldlevel = 2 " init open/closed state of all folds (open unless nested < 2 levels deep)
let g:fold_rspec_foldminlines = 3 " disables closing of folds containing <= 2 lines
" }}}

" " elixir
" TODO: necessary with treesitter and LSP?
Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" let g:alchemist_tag_map = '<leader>f'

" python {{{
" TODO: replace w/ treesitter at some point?
Plug 'tweekmonster/braceless.vim' " Python vaP
let g:braceless_generate_scripts = 1
autocmd FileType python,haml,coffee BracelessEnable +indent +fold
autocmd FileType yaml BracelessEnable +fold
" }}}

" {{{ clojure TODO: keep?
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
" }}}

" misc lang
Plug 'neovimhaskell/haskell-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'chr4/nginx.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'kkvh/vim-docker-tools'

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture' " fzf rg pass args
" fzf note taking
Plug 'alok/notational-fzf-vim'
let g:nv_search_paths = ['~/notes', '~/til']

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" fast jump last buffer
nnoremap <silent> \b :call fzf#vim#buffers()<cr><cr>
" buf switch no preview
nnoremap <silent> \t :call fzf#vim#buffers()<cr>
nnoremap <silent> <space>ft :Buffers<CR>
nnoremap <silent> <space>fw :Windows<CR>
nnoremap <silent> <space>ff :Files<CR>
nnoremap <silent> <space>fg :Rg<CR>
noremap  <silent> <space>fb :execute "BLinesPreview '<c-r><c-w>"<cr>
noremap  <silent> <space>fB :execute "Lines '<c-r><c-w>"<cr>
nnoremap <silent> <space>fo :BTags<CR>
nnoremap <silent> <space>fO :Tags<CR>
" nnoremap <silent> <space>fk :execute 'Tags ' expand('<cword>')<cr>
noremap  <silent> <space>fk :execute "Tags '<c-r><c-w>"<cr>
nnoremap <silent> <space>fm :call fzf#vim#marks()<cr>
nnoremap <silent> <space>fh :Helptags<CR>
nnoremap <silent> <space>f; :History:<CR>
nnoremap <silent> <space>f/ :History/<CR>
nnoremap <silent> <space>f? :History<CR>
nnoremap <silent> <space>fc :BCommits<CR>
nnoremap <silent> <space>fC :Commits<CR>
nnoremap <silent> K :call SearchWordWithRg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>

" files in current dir
nnoremap <silent> <Space>f. :Files <C-r>=expand("%:h")<CR>/<CR>
if filereadable('config/routes.rb')
  " This looks like a Rails app.
  nnoremap <silent> <Space>ec :Files app/controllers<CR>
  nnoremap <silent> <Space>eh :Files app/helpers<CR>
  nnoremap <silent> <Space>ei :Files config/initializers<CR>
  nnoremap <silent> <Space>em :Files app/models<CR>
  nnoremap <silent> <Space>es :Files app/assets/stylesheets<CR>
  nnoremap <silent> <Space>ev :Files app/views<CR>
  if isdirectory('test')
    nnoremap <silent> <Space>et :Files test<CR>
  else
    nnoremap <silent> <Space>et :Files spec<CR>
  endif
elseif filereadable('src/index.js')
  " TODO: adjust dir names
  " This looks like a React app.
  nnoremap <silent> <Space>ec :Files src/components<CR>
  nnoremap <silent> <Space>es :Files src/styles<CR>
  nnoremap <silent> <Space>et :Files src/__tests__/components<CR>
endif

imap <c-s><c-k> <plug>(fzf-complete-word)
imap <c-s><c-f> <plug>(fzf-complete-path)
imap <c-s><c-j> <plug>(fzf-complete-file-ag)
" complete lines from all open buffers
imap <c-s><c-l> <plug>(fzf-complete-line)
" complete lines global
inoremap <expr> <c-s><c-g> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-o': ':r !echo',
  \ 'ctrl-g': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-u': '15split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_commands_expect = 'ctrl-enter,ctrl-s'

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

command! -bang -nargs=* BLinesPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
" }}}

" fzf like :Help but scoped to intalled vim-plug plugins
function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'vnew' match | setf help
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction
command! HelpPlug call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))
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
\   'run': 'python3 %:p',
\ },
\ 'javascript': {
\   'launch': 'node %:p',
\   'run': 'node %:p',
\ },
\ 'applescript': {
\   'launch': 'osascript -l JavaScript %:p',
\   'run': 'osascript %:p',
\ },
\}
" }}}

Plug 'rhysd/open-pdf.vim'
Plug 'chrisbra/csv.vim'
