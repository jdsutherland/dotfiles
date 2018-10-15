scriptencoding utf-8

" Basic Settings
let g:mapleader = ','
filetype plugin indent on
syntax on
runtime macros/matchit.vim
set shell=/bin/zsh
set modelines=0
set smarttab
set autowrite
set expandtab
set shiftwidth=2
set softtabstop=2
" set shortmess+=c " don't show completion number in status
set shortmess=aoOtIc
set pumheight=20
set tabstop=2
" attempt to disable inadvertent trackpad clicks
set mouse=
set conceallevel=2
set smartindent
set autoindent
set scrolloff=3
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
set updatetime=250 " https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set laststatus=2
" show filename rather than full path
set statusline=%t
set ignorecase
set smartcase
set gdefault
set incsearch
set inccommand=nosplit
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set formatoptions-=cro
if exists('+spelllang')
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add
set thesaurus=~/.vim/spell/thesaurus/mthesaur.txt
set noswapfile
" Set the tag file search order
set tags=tags
set path=.
" Session settings
set sessionoptions-=options " don't store global and local values in a session
set sessionoptions-=folds   " don't store folds
set foldmethod=marker
set splitbelow
set splitright
" set statusline+=%{ConflictedVersion()} " TODO: add to airline
set diffopt+=vertical

" base16 vim
if filereadable(expand('~/.vimrc_background'))
  let g:base16colorspace=256
  source ~/.vimrc_background
endif

" color
" set background=dark
" set termguicolors

colorscheme base16-default-dark
highlight Comment cterm=italic

" Display extra whitespace
set listchars=tab:→\ ,trail:∙,nbsp:•,eol:¶

" Rg
set grepprg=rg\ --smart-case\ --vimgrep

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile

set noshowmode
