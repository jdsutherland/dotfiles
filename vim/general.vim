" Basic Settings
let mapleader = ","
filetype plugin indent on
syntax on
runtime macros/matchit.vim
set shell=/bin/zsh
set modelines=0
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set noshowmode
set shortmess+=c " don't show completion number in status
set pumheight=20
set tabstop=2
set mouse=
set conceallevel=2
set autoindent
set encoding=utf-8
set scrolloff=3
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
if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add
set thesaurus=~/.vim/spell/thesaurus/mthesaur.txt
set noswapfile
" Set the tag file search order
set tags=tags
set path=.
" Session settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set splitbelow
set splitright
set stl+=%{ConflictedVersion()}
set diffopt+=vertical

" base16 vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" color
" set background=dark
" set termguicolors

colorscheme base16-default-dark
highlight Comment cterm=italic

" Display extra whitespace
set listchars=tab:→\ ,trail:∙,nbsp:•

" Rg
set grepprg=rg\ --vimgrep

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile
