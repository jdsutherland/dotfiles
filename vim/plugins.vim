function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " browser textarea
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
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

Plug 'carakan/pmv.vim' " packages
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
Plug 'Konfekt/FastFold'
Plug 'dbatten5/vim-macroscope', {'branch': 'main'}
Plug 'dkarter/bullets.vim' " markdown lists
let g:bullets_renumber_on_change = 0
Plug 'bergercookie/vim-debugstring'
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
nnoremap <silent> <space>o :silent Vista finder coc<CR>
nnoremap <silent> <space>O :silent Vista finder ctags<CR>
nnoremap <silent> \z :Vista!!<CR>
" }}}

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascriptreact', 'typescript.tsx', 'typescriptreact', 'eruby', 'scss', 'sass']
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

nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap ,hs :CocCommand git.chunkStage<cr>
nmap ,hu :CocCommand git.chunkUndo<cr>
nmap ,hc <Plug>(coc-git-chunkinfo)

" scroll hover popup
nnoremap <nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-n>"
nnoremap <nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-p>"
" TODO: not working
" inoremap <nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<c-n>"
" inoremap <nowait><expr> <C-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<c-p>"

nnoremap ,sS :CocList -A snippets<cr>
nnoremap ,SS :CocFzfList snippets<cr>
nnoremap <silent> ,ss :CocCommand snippets.editSnippets<cr>

nnoremap <silent> <space>p :<C-u>CocList -A --normal yank<cr>
" TODO: errors
nnoremap <silent> <space>P :<C-u>CocFzfList yank<cr>

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

" Remap keys for gotos
autocmd User CocNvimInit nmap <expr>,f CocHasProvider('documentSymbol') ? "<Plug>(coc-definition)" : "<C-]>zt"
" open def in split
autocmd User CocNvimInit nmap <expr>,fv CocHasProvider('documentSymbol') ? ":call CocAction('jumpDefinition', 'vsplit')<CR><C-w><C-p>" : ":vs<cr><c-]><C-w><C-p>zt"
autocmd User CocNvimInit nmap <expr>,fs CocHasProvider('documentSymbol') ? ":call CocAction('jumpDefinition', 'split')<CR><C-w><C-p>" : ":sp<cr><c-]><C-w><C-p>zt"
nmap <silent> <c-[> <Plug>(coc-definition)

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
nmap \cn <Plug>(coc-rename)
nmap \ca <Plug>(coc-codeaction)
nmap \cf <Plug>(coc-fix-current)
nmap \cl <Plug>(coc-codelens-action)
nmap \cF <Plug>(coc-format)
nmap <silent> \cd <Plug>(coc-declaration)
nmap <silent> \cy <Plug>(coc-type-definition)
nmap <silent> \ci <Plug>(coc-implementation)
nmap <silent> \cr <Plug>(coc-references)
nmap <silent> \cR <Plug>(coc-refactor)
nnoremap \cc :cclose<cr>:pclose<cr>:call coc#util#float_hide()<cr>
nnoremap \cC :silent CocRestart<cr>

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
map <cr>g griw
map <cr>G gr$
Plug 'wellle/targets.vim'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-exchange'
nmap cX cx$
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
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
let g:VtrClearBeforeSend = 0
" TODO: does M-e from tmux or vim bind?
" nnoremap <M-e> :VtrFocusRunner<cr>
nnoremap \vv :VtrSendCommandToRunner<space>
" repeat last command
nnoremap \V :w<esc>:VtrSendCommandToRunner<space><cr>
" shortcut to mapping a temp runner with
nnoremap \vb :nnoremap ,t :VtrSendCommandToRunner<space>
" repeat last command
nnoremap \vo :VtrOpenRunner<cr>
nnoremap \va :VtrAttachToPane<cr>
" nnoremap \vv :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap \vq :VtrKillRunner<cr>
nnoremap \vd :VtrSendCtrlD<cr>
nnoremap \vc :VtrSendCtrlC<cr>
nnoremap \vf :VtrSendFile<cr>
" send everything
" nmap ,sL vae<leader>sl
" " nmap <CR>f gv<leader>sl TODO: new map
vmap <CR>f ,sl
" " useful resending sql
nmap <cr>F vap,sl
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

Plug 'tommcdo/vim-lion'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" {{{ mark
" TODO: mark colors
Plug 'inkarkat/vim-mark' | Plug 'inkarkat/vim-ingo-library'
let g:mw_no_mappings = 1
let g:mwDefaultHighlightingPalette = 'maximum'
nmap <space>I <Plug>MarkSet
" }}}

Plug 'tversteeg/registers.nvim'

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
" Plug 'elixir-editors/vim-elixir'
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

" golang TODO: needed w/ treesitter? {{{
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
Plug 'tmux-plugins/vim-tmux'
Plug 'kkvh/vim-docker-tools'

" {{{ UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
nnoremap <silent> <space>dd :BufferClose<CR>
Plug 'jdsutherland/nvim-base16'
Plug 'jdsutherland/lualine.nvim'

" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture' " fzf rg pass args
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" fast jump last buffer
nnoremap <silent> \b :call fzf#vim#buffers()<cr><cr>
nnoremap <silent> \t :call fzf#vim#buffers()<cr>
nnoremap <silent> \T :Buffers<CR>
nnoremap \w :Windows<CR>
nnoremap <M-f> :Files<CR>
nnoremap <M-g> :Rg<CR>
noremap ,bl :execute "BLinesPreview '<c-r><c-w>"<cr>
noremap ,bL :execute "Lines '<c-r><c-w>"<cr>
nnoremap <silent> ,o :BTags<CR>
nnoremap <silent> ,O :Tags<CR>
nnoremap <silent> ,mm :call fzf#vim#marks()<cr>
nnoremap <silent> ,ht :Helptags<CR>
nnoremap <silent> ,h/ :History/<CR>
nnoremap <silent> ,h; :History:<CR>
nnoremap <silent> ,/ :History/<CR>
nnoremap <silent> ,? :History<CR>
nnoremap <silent> ,gl :Commits<CR>
nnoremap <silent> ,ga :BCommits<CR>
nnoremap <silent> ,gs :GFiles?<CR>
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
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
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

Plug 'rhysd/open-pdf.vim'
Plug 'chrisbra/csv.vim'
