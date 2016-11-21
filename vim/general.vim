" Basic Settings
let mapleader = ","
filetype plugin indent on
syntax on
runtime macros/matchit.vim
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
set lazyredraw
set ruler
set backspace=indent,eol,start
set history=500
set updatetime=750 " https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set laststatus=2
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
set noswapfile
" Set the tag file search order
set tags=./tags;
" Session settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set splitbelow
set splitright
set stl+=%{ConflictedVersion()}
set diffopt+=vertical

" color
set background=dark
let base16colorspace=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme base16-tomorrow

" Display extra whitespace
set listchars=tab:→\ ,trail:∙,nbsp:•

" Ag
set grepprg=ag

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile
