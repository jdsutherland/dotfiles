function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'vimproc.vim',' {'do' : 'make'}
" Plug 'Shougo/neco-syntax'
" Plug 'Shougo/neco-vim' " vimscript
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-zsh'
" Plug 'SevereOverfl0w/deoplete-github'
" Plug 'fszymanski/deoplete-abook'
" Plug 'thalesmello/webcomplete.vim'
" Plug 'zchee/deoplete-clang'
" Plug 'tweekmonster/deoplete-clang2'
" Plug 'wokalski/autocomplete-flow'
" Plug 'landaire/deoplete-swift', { 'for': 'swift' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --global tern' }
" Plug 'Shougo/deoplete-rct', { 'for': ['ruby', 'eruby'] }
" Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'eruby'] }

" neovim completion manager
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'roxma/nvim-cm-tern', { 'do': 'npm install' }
Plug 'roxma/ncm-rct-complete' "ruby
Plug 'rip-rip/clang_complete'
Plug 'roxma/ncm-clang'
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp', 'h', 'objc'] }

Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'

" general
Plug 'AndrewRadev/linediff.vim'
Plug 'Cypher1/nvim-rappel'
Plug 'sjl/vitality.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
Plug 'FooSoft/vim-argwrap'
Plug 'PeterRincker/vim-argumentative'
Plug 'SirVer/ultisnips' | Plug 'jdsutherland/vim-snippets'
Plug 'jvanja/vim-bootstrap4-snippets'
Plug 'Valloric/ListToggle'
Plug 'breuckelen/vim-resize'
Plug 'bronson/vim-visual-star-search'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-quicklink'
Plug 'dietsche/vim-lastplace'
Plug 'dzeban/vim-log-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-gazetteer'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'Chun-Yang/vim-textobj-chunk' | Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'sickill/vim-pasta'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'
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
Plug 'sunaku/vim-hicterm'
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
Plug 'dhruvasagar/vim-table-mode'
Plug 'duff/vim-ddldbl'
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'inside/vim-grep-operator'
Plug 'chrisbra/NrrwRgn'
Plug 'junegunn/heytmux'
Plug 'wincent/terminus'
Plug 'wincent/loupe'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-halo'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'djdt/pyparens.nvim'
Plug 'Valloric/MatchTagAlways'
Plug 'tweekmonster/braceless.vim'
Plug 'haya14busa/vim-auto-programming' " TODO: check
Plug 'xtal8/traces.vim' " sorta incsearch for range and patterns

" search
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'dyng/ctrlsf.vim'

" neovim specific
Plug 'kassio/neoterm'

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
Plug 'Ron89/thesaurus_query.vim'
Plug 'reedes/vim-litecorrect'
Plug 'guanqun/vim-mutt-aliases-plugin'


" git
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'rhysd/github-complete.vim'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-bbye'
Plug 'junegunn/vim-github-dashboard'

" javascript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript'
Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'jsx'] }
Plug 'nikvdp/ejs-syntax', { 'for': 'ejs' }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'moll/vim-node'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug 'Quramy/vim-js-pretty-template'
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'nono/vim-handlebars'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" Plug 'sindresorhus/vim-xo'
" Plug 'burnettk/vim-angular', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx'
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'jsx'] }
" typescript
" Plug 'mhartington/nvim-typescript'
" Plug 'leafgarland/typescript-vim'

" html/css
Plug 'ap/vim-css-color', { 'for': ['scss', 'less', 'css', 'eruby'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim', { 'for': ['html', 'scss', 'less', 'css', 'eruby'] }
Plug 'tpope/vim-jdaddy'
Plug 'wavded/vim-stylus'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'

" ruby
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'rhysd/vim-textobj-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }
Plug 'rlue/vim-fold-rspec', { 'for': 'ruby' }

" style/color
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jdsutherland/base16-vim'
Plug 'jdsutherland/tmuxline.vim'
Plug 'powerman/vim-plugin-AnsiEsc'

" c
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp', 'h', 'objc'] }

" csharp
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs', 'do': 'cd server && xbuild' }
" Plug 'https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'for': 'cs' }

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" python
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
Plug 'tweekmonster/impsort.vim', { 'for': ['python'] }
Plug 'lambdalisue/vim-pyenv', { 'for': ['python'] }
Plug 'tweekmonster/django-plus.vim'
" Plug 'python-mode/python-mode', { 'for': ['python'] }


" scala
" Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" Plug 'ktvoelker/sbt-vim', { 'for': 'scala' }
" Plug 'mpollmeier/vim-scalaConceal'
" Plug 'dansomething/vim-eclim'
" Plug 'sassanh/nvim-cm-eclim'

" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ivy/vim-ginkgo'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" TODO: nsf/gocode deprecated - switch to this fork eventually
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'sebdah/vim-delve'

" other apps
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'

" misc lang
Plug 'exu/pgsql.vim', { 'for': ['sql', 'psql'] }
Plug 'tpope/vim-dadbod'
Plug 'moskytw/nginx-contrib-vim'
Plug 'plasticboy/vim-markdown'
" Plug 'rlue/vim-getting-things-down' " highlighting conflicts with plasticboy https://github.com/rlue/vim-getting-things-down/blob/master/after/syntax/markdown.vim
" Plug 'itspriddle/vim-marked' TODO: slow
Plug 'tmux-plugins/vim-tmux'
" Plug 'ekalinin/Dockerfile.vim'
" Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'Shougo/vinarise.vim' " hex
Plug 'junegunn/vader.vim'
Plug 'dominikduda/vim_current_word'
Plug 'baverman/vial', { 'for': 'http' }
Plug 'baverman/vial-http', { 'for': 'http' }
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
" Plug 'itchyny/dictionary.vim'
Plug 'fncll/wordnet.vim'
Plug 'chrisbra/csv.vim'
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }
Plug 'xavierchow/vim-sequence-diagram'
