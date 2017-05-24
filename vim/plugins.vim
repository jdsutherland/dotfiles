function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" neovim specific (probably more below... oh well)
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/vimproc.vim'
Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'

" general
" Plug 'thalesmello/vim-textobj-methodcall'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/linediff.vim'
Plug 'Cypher1/nvim-rappel'
Plug 'Olical/vim-syntax-expand'
Plug 'sjl/vitality.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'FooSoft/vim-argwrap'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'jdsutherland/vim-snippets'
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
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'Chun-Yang/vim-textobj-chunk' | Plug 'jceb/vim-textobj-uri' | Plug 'lucapette/vim-textobj-underscore'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'rondale-sc/vim-spacejam'
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
Plug 'wellle/tmux-complete.vim'
Plug 'wellle/visual-split.vim'
Plug 'mtth/scratch.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'sunaku/vim-hicterm'
Plug 'osyo-manga/vim-over'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'rhysd/clever-f.vim'
Plug 'tommcdo/vim-lion'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-scripts/BufOnly.vim'
Plug 'machakann/vim-sandwich'
Plug 'bounceme/poppy.vim'
Plug 'troydm/zoomwintab.vim'
Plug 'google/vim-searchindex'
Plug 'triglav/vim-visual-increment'
Plug 'mattboehm/vim-unstack'
Plug 'mattboehm/vim-accordion'

" Plug 'wincent/ferret'
" https://github.com/wesQ3/vim-windowswap
" https://github.com/fadein/vim-FIGlet
" google plugins dont work for some reason
" Plug 'google/vim-codereview'
" Plug 'google/vim-syncopate'
" Plug 'google/vim-maktaba'

" writing
Plug 'junegunn/vim-emoji'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-wordy'
Plug 'rhysd/vim-grammarous'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'

" Plug 'dpelle/vim-LanguageTool'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" git
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'rhysd/github-complete.vim'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'moll/vim-bbye'
Plug 'junegunn/vim-github-dashboard'
Plug 'google/vim-searchindex'

" javascript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
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
Plug 'Quramy/vim-js-pretty-template'
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'nono/vim-handlebars'
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" html/css
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'ap/vim-css-color', { 'for': ['scss', 'less', 'css', 'eruby'] }
" Plug 'chrisbra/Colorizer'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby', 'javascript', 'jsx'] }
Plug 'othree/html5.vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'tpope/vim-jdaddy'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'hail2u/vim-css3-syntax'

" ruby
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'uby', 'yaml'] }
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'rhysd/vim-textobj-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }

" style/color
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jdsutherland/base16-vim'
Plug 'jdsutherland/tmuxline.vim'
Plug 'powerman/vim-plugin-AnsiEsc'

" c
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp'] }
Plug 'critiqjo/lldb.nvim', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }

" csharp
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs', 'do': 'cd server && xbuild' }
Plug 'https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'for': 'cs' }

" other apps
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'
Plug 'blindFS/vim-taskwarrior'
" Plug 'vimwiki/vimwiki' | Plug 'tbabej/taskwiki'

" misc lang
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'moskytw/nginx-contrib-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'suan/vim-instant-markdown'
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tmux-plugins/vim-tmux'
Plug 'ekalinin/Dockerfile.vim'
