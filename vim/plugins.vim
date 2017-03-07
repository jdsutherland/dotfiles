function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" neovim specific (probably more below... oh well)
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/vimproc.vim'
Plug 'benekastah/neomake'

" general
" Plug 'thalesmello/vim-textobj-methodcall'
" Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'FooSoft/vim-argwrap'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/ListToggle'
Plug 'breuckelen/vim-resize'
Plug 'bronson/vim-visual-star-search'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'dietsche/vim-lastplace'
Plug 'dzeban/vim-log-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'
Plug 'james9909/stackanswers.vim'
Plug 'janko-m/vim-test'
" Plug 'jbarbero/doctabs.vim'
Plug 'jeetsukumaran/vim-gazetteer'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'rondale-sc/vim-spacejam'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'sickill/vim-pasta'
Plug 'skwp/greplace.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
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
Plug 'moll/vim-bbye'

" javascript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'jsx'] }
Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }
Plug 'nikvdp/ejs-syntax', { 'for': 'ejs' }
" Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --global tern' }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx'] }
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug 'Quramy/vim-js-pretty-template', { 'for': ['javascript', 'jsx'] }
Plug 'bentayloruk/vim-react-es6-snippets', { 'for': ['javascript', 'jsx'] }
Plug 'nono/vim-handlebars', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" html/css
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'ap/vim-css-color', { 'for': ['scss', 'less', 'css', 'eruby'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'helino/vim-json', { 'for': 'json' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby', 'javascript', 'jsx'] }
Plug 'othree/html5.vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'tpope/vim-jdaddy'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }

" ruby
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'uby', 'yaml'] }
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'rhysd/vim-textobj-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
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
" Plug 'rking/ag.vim'

" misc lang
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'moskytw/nginx-contrib-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'suan/vim-instant-markdown'
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'mux-plugins/vim-tmux'
