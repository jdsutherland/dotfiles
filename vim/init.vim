call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/vimproc.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'osyo-manga/vim-monster'
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'critiqjo/lldb.nvim', { 'for': ['c', 'cpp'] }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'bling/vim-airline'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'ludovicchabant/vim-gutentags'
" Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'helino/vim-json', { 'for': 'json' }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'rudes/vim-java', { 'for': 'java' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'ryanoasis/vim-devicons' " file drawer
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'skwp/greplace.vim'
" TODO: get yankstack back?
" Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'kablamo/vim-git-log'
Plug 'alexdavid/vim-min-git-status'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'rhysd/github-complete.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-utils/vim-man'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'regedarek/ZoomWin'
Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'PeterRincker/vim-argumentative'
Plug 'jiangmiao/auto-pairs'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-jdaddy'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'janko-m/vim-test'
Plug 'bronson/vim-visual-star-search'
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-conflicted'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'thalesmello/vim-textobj-methodcall'
Plug 'wellle/targets.vim'
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'junegunn/vim-easy-align'
Plug 'breuckelen/vim-resize'
Plug 'vitalk/vim-simple-todo'
Plug 'dzeban/vim-log-syntax'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-journal'
Plug 'jeetsukumaran/vim-gazetteer/'
" TODO: https://github.com/keith/investigate.vim ??
Plug 'pbrisbin/vim-mkdir'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'

call plug#end()
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>
let g:vim_resize_disable_auto_mappings = 1
let g:table_mode_disable_mappings = 1

let g:simple_todo_map_keys = 0

nmap ,i <Plug>(simple-todo-new)
nmap ,I <Plug>(simple-todo-new-start-of-line)
nmap ,0 <Plug>(simple-todo-below)
imap ,0 <Plug>(simple-todo-below)
" nmap ,O <Plug>(simple-todo-above)
nmap ,x <Plug>(simple-todo-mark-as-done)
imap ,x <Plug>(simple-todo-mark-as-done)
nmap ,X <Plug>(simple-todo-mark-as-undone)
imap ,X <Plug>(simple-todo-mark-as-undone)
nmap ,l <Plug>(simple-todo-new-list-item)

nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin 'sevko/vim-nand2tetris-syntax'
" Plugin 'raymond-w-ko/vim-niji'
" Plugin 'mxw/vim-jsx'

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" All of your Pnmap <D-N> :NERDTreeToggle<CR>lugins must be added before the following line
filetype plugin indent on    " required

" Use the colorscheme from above
set background=dark
let base16colorspace=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme base16-tomorrow
" colorscheme OceanicNext

" PLUGIN SETTINGS
" let g:yankstack_map_keys = 0
" call yankstack#setup()
" nmap <space>p <Plug>yankstack_substitute_older_paste
" nmap <space>P <Plug>yankstack_substitute_newer_paste
nnoremap Y y$
" function! YRRunAfterMaps()
"   nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
" endfunction

" workaround to use ag.vim
let g:fzf_command_prefix = 'Fzf'
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
nnoremap <silent> ,t :FzfFiles<CR>
nnoremap <silent> ,b :FzfBuffers<CR>
nnoremap <silent> ,ss :FzfSnippets<CR>
nnoremap <silent> ,A :FzfWindows<CR>
nnoremap <silent> ,; :FzfBLines<CR>
nnoremap <silent> ,. :FzfLines<CR>
nnoremap <silent> ,o :FzfBTags<CR>
nnoremap <silent> ,O :FzfTags<CR>
nnoremap <silent> ,? :FzfHistory<CR>
nnoremap <silent> ,gl :FzfCommits<CR>
nnoremap <silent> ,ga :FzfBCommits<CR>
nnoremap <silent> ,gs :FzfGFiles?<CR>
nnoremap <silent> ,ft :FzfFiletypes<CR>
nnoremap <silent> ,m :FzfMap<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap ,gg :FzfAg<CR>
nnoremap ,/ :Ag ""<left>
nnoremap ,gcf :exec "Ag " . expand("%:t:r")<CR>
nnoremap ,af :AgFile ""<Left>
nnoremap ,ad :Ag 'def<space>
nnoremap <silent> ,ag :Ag <cword><CR>
vnoremap ,ag :<C-U>execute "Ag " . GetVisual()<CR>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:fzf_layout = { 'window': 'new' }

  function! SearchWordWithAg()
    execute 'FzfAg' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'FzfAg' selection
  endfunction

let g:airline_theme='base16_default'
" let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':r'
let g:airline#extensions#tabline#show_tab_nr = 1

let g:switch_mapping = "-"
" let g:linediff_second_buffer_command = 'rightbelow vertical new'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_loc_list_height=3
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#disable_auto_complete = 1
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-Space>
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <C-S> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
" inoremap <Leader><Tab> <Space><Space>
" let g:SuperTabDefaultCompletionType = '<c-n>'
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:UltiSnipsListSnippets="<a-s>"

" With deoplete.nvim (ruby)
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


" UltiSnips config
" inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

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
let g:neomake_java_javac_classpath = '.'
autocmd! BufWritePost * Neomake
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_json_checkers=['jsonlint']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
" let g:syntastic_html_tidy_ignore_errors = [
"   \   ' proprietary attribute "ng-'
"   \ , '<img> proprietary attribute "fb-src"'
"   \ , '<img> lacks "alt" attribute'
"   \ , '<img> lacks "src" attribute'
"   \ ]

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

" Use octodown as default build command for Markdown files
au BufRead,BufNewFile *.json set filetype=json
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
let g:sql_type_default = 'pgsql'

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

let test#strategy = 'neovim'
let g:test#preserve_screen = 1
set stl+=%{ConflictedVersion()}
set diffopt+=vertical

let g:toggle_list_no_mappings = 1 " Disable default mappings.
"
nmap <script> <silent> \\ :call ToggleQuickfixList()<CR>
nnoremap <silent> \d :lcl<CR>
nnoremap <silent> \e :Errors<CR>

" let g:SuperTabLongestEnhanced = 1
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType ="<C-X><C-O>"

" RUBY STUFF
" ========================================================================
syntax on                 " Enable syntax highlighting

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  " autocmd FileType ruby,eruby,yaml,python setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

" Basic Settings
filetype plugin indent on
syntax on
set shell=/bin/zsh
set nocompatible
set modelines=0
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest:list,full
set completeopt-=preview
" Ignore stuff that can't be opened
set wildignore+=tmp/**
set visualbell
set ttyfast
set lazyredraw
set ruler
set backspace=indent,eol,start
set history=500
set updatetime=750 " https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set laststatus=2
" set number
" set relativenumber
set noundofile
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set formatoptions=qrn1
" spell off by default
set spell spelllang=en_us
set spell!
set spellfile=$HOME/.vim-spell-en.utf-8.add
" TODO: set kspell only for git and markdown
" set complete+=kspell
" set colorcolumn=80
nnoremap [oU :set colorcolumn=81<CR>
nnoremap ]oU :set colorcolumn=0<CR>
nnoremap co<bar> :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>
" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" Ag
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
let g:ag_prg='true ; f(){ ag --column "$@" \| cut -c 1-'.(&columns - 6).' }; f'

autocmd BufLeave,FocusLost * silent! wall
vnoremap . :norm.<CR>
set noswapfile

" MAPPINGS
let mapleader = ","
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <space>z za
" Fold a tag
" nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" nnoremap ,q <C-w><C-p>
" Select up until most recently changed
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ea <C-w><C-v><C-l>:e ~/.vim/bundle/vim-snippets/UltiSnips/
"nnoremap <leader>w <C-w>v<C-w>l
" nnoremap <leader>j VIPs
" nnoremap <leader>f 1z=
nnoremap <leader>d :read !date<CR>
nnoremap <leader>r :!!<CR>
" nnoremap <leader>m :Normal @a
nnoremap <silent> <leader>a :ArgWrap<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>N :set nonumber!<CR>:set norelativenumber!<CR>
nnoremap <leader>L :set list!<CR>
nnoremap <cr><cr> :nohls<CR>
" open prev buffer
nnoremap <cr>b <C-^>
" Karabiner cmd_l to previous spit
nnoremap <M-q> <C-W>p
nnoremap <leader>p :set nopaste!<CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>hp :!open -a Google\ Chrome %<CR><CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" replace with system clipboard
nmap ,gr "*gr

" nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>
" hash rocket
imap ,rr <space>=><space>
imap ,aa ->
imap ,uu __
nmap ,cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
nnoremap <silent> ,zz :TagbarToggle<CR>
nnoremap <silent> ,xx :TagbarOpen fj<CR>
nnoremap <silent> ,zx :TagbarTogglePause<CR>
" overwrite inner word with yank buffer
nnoremap ,ow "_diwhp
map ,` ysiw`
" nnoremap ,. '.
" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>
"Move back and forth through previous and next buffers "with ,z and ,x
" nnoremap <silent> ,z :bp<CR>
" nnoremap <silent> ,x :bn<CR>
map <silent> ,gz <C-w>o "Zoom
" get name and path
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>
" nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>

" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>

" nnoremap <Tab> gt
" nnoremap <S-Tab> gT

" Resize windows with arrow keys
nnoremap <c-Up> <C-w>+
nnoremap <c-Down> <C-w>-
nnoremap <c-Left> <C-w><
nnoremap <c-Right>  <C-w>>

" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <D-k> _
imap <silent> <D-d> _
imap <silent> <D-K> -
imap <silent> <D-D> -

" move up/down quickly by using Cmd-j, Cmd-k
" " which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {
" }===========================
" Tabularize - alignment
" ============================
" Hit Cmd-Shift-A then type a character you want to align by
nmap <D-A> :Tabularize /
vmap <D-A> :Tabularize /

" SEARCH

" nnoremap ,ag :Ag<space>
"grep the current word using K (mnemonic Kurrent)
"grep visual selection
" "grep current word up to the next exclamation point using ,K
" nnoremap ,K viwf!:<C-U>execute "Ag " . GetVisual()<CR>
"grep for 'def foo'
",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
" Usages of current file

" NAVIGATION

" goto def (ctags)
nnoremap <silent> ,f <C-]>zz
" use ,F to jump to tag in a vertical split
" nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>zz
" nnoremap <silent>,F <C-]> <C-w><C-]><C-w>T
nnoremap <silent>,T :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> ,fs :sp<CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>
nnoremap <silent> ,fv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>

" preview tag above
" nnoremap <silent> <space>ll :set nosb<CR>:exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>ll :exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>lc :pclose<CR>
nnoremap <silent> ,vs   :vert stag<space>
nnoremap <silent> ,gf   :vertical botright wincmd F<CR>
nnoremap gk :Dash<CR>

set splitbelow
set splitright
" Create window splits easier.
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

nnoremap <space>D :bd<CR>

nmap <A-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
nnoremap <F10> :LL next<CR>
nnoremap <F11> :LL step<CR>
nnoremap <S-F11> :LL finish<CR>

" ruby bindings
nmap <leader>bp orequire 'pry'; binding.pry<esc>^

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gS :Gministatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gB :Gbrowse<CR>
nnoremap <space>gp :Git add --patch<CR>
" nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gL :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gl :GitLog<space>
nnoremap <space>gP :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gbr :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
command! GdiffInTab tabedit %|Gdiff
nnoremap <space>gd :GdiffInTab<cr>
nnoremap <space>dt :diffthis<cr>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dp :diffput<space>
nnoremap <leader>dg :diffget<space>
" test bindings
nnoremap <silent> <space>tt :TestNearest<CR>
nnoremap <silent> <space>ts :TestSuite<CR>
nnoremap <silent> <space>T :TestFile<CR>
" nnoremap <silent> <leader>a :TestSuite<CR>
" nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <space>tv :vsp<CR>:exec ':TestVisit'<CR>
nnoremap <silent> <space>tc :tabclose<CR>

" Set the tag file search order
set tags=./tags;
" Session settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

let g:EasyMotion_leader_key = '<Space><space>'

" swap colons
nnoremap ; :
nnoremap : ;
" `` goes to line and column; more useful
nnoremap ' `
nnoremap ` '
" ^ goes to first character; more useful
nnoremap 0 ^
nnoremap ^ 0
" 4 goes to end of line
nnoremap 4 $
nnoremap $ 4
vnoremap 4 $
vnoremap $ 4
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" " keep selection after in/outdent
" vnoremap < <gv
" vnoremap > >gv

" Control shortcuts
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" Execute macro in q
map Q @q
autocmd FileType vim setlocal keywordprg=:help " Open vim help under cursor

" Display extra whitespace
set list listchars=tab:»·,trail:·

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak


function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
" nmap <leader>w :StripTrailingWhitespaces<CR>
nnoremap <silent><leader>w :call <SID>StripTrailingWhitespaces()<CR>

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nmap <C-w>u :call MergeTabs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> <space>dd :call CloseWindowOrKillBuffer()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join (keys(typo), '\|').'/\=typo[submatch(0)]/ge'
    :%s/\r/ /
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sub :%s///g<left><left>
vnoremap <Leader>sub :s///g<left><left>
nnoremap <leader>wub :%s//<C-r><C-w>/g<cr>

" Reselect pasted text. Mnem: 'Get pasted'
nnoremap gp '[v']
" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" Resume last edit position on opening buffer
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Automatically fit quickfix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Similarly, autofit preview window height
"cset previewheight=15
" au BufEnter ?* call PreviewHeightWorkAround()
" func PreviewHeightWorkAround()
"     if &previewwindow
"         exec 'setlocal winheight='.&previewheight
"     endif
" endfunc

" Source surround mappings seperately (breaks vimrc syntax highlighting)
so ~/.vimrc.chrome
so ~/.vimrc.tabs
so ~/.vimrc.surrounds
" so ~/.vimrc.ctrlp
so ~/.vimrc.openchangedfiles
