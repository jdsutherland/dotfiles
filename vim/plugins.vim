function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" neovim specific (probably more below... oh well)
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/vimproc.vim'
Plug 'benekastah/neomake'

" general
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'FooSoft/vim-argwrap'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'breuckelen/vim-resize'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'dzeban/vim-log-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-gazetteer'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'thalesmello/vim-textobj-methodcall' | Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'milkypostman/vim-togglelist'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'skwp/greplace.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-utils/vim-man'
Plug 'vitalk/vim-simple-todo'
Plug 'wellle/targets.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'rhysd/github-complete.vim'
Plug 'tpope/vim-fugitive'

" javascript
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'nono/vim-handlebars', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" html/css
" Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'helino/vim-json', { 'for': 'json' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'othree/html5.vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'tpope/vim-jdaddy'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }

" ruby
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'eruby', 'yaml'] ,}
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby', 'yaml'] }
" Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }

" style/color
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
" Plug 'junegunn/rainbow_parentheses.vim'

" c
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp'] }
Plug 'critiqjo/lldb.nvim', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }

" other apps
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'

" misc lang
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
