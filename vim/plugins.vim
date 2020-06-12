function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" {{{ncm2 completion manager
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-highprio-pop'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'wellle/tmux-complete.vim'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-tagprefix'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-gtags'
" Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
" Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp', 'h', 'objc'] }
" Plug 'yuki-ycino/ncm2-dictionary'
" Plug 'filipekiss/ncm2-look.vim'
" }}}

" Plug 'Yggdroot/indentLine', { 'for': ['html', 'pug'] }
" let g:indentLine_enabled = 0
Plug 'terryma/vim-expand-region'

Plug 'skywind3000/asyncrun.vim'
" delete?
" Plug 'sjl/vitality.vim'
Plug 'sbdchd/neoformat'
" Plug 'whatyouhide/vim-lengthmatters'
" Plug 'haya14busa/vim-auto-programming' " TODO: check
" Plug 'junegunn/heytmux'
" Plug 'xtal8/traces.vim' " does inccomand cover this?
" Plug 'wellle/visual-split.vim'
" Plug 'dyng/ctrlsf.vim'

" general
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'
Plug 'AndrewRadev/linediff.vim'
Plug 'Cypher1/nvim-rappel'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
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
Plug 'christoomey/vim-quicklink'
Plug 'christoomey/vim-rfactory'
Plug 'dietsche/vim-lastplace'
Plug 'dzeban/vim-log-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-gazetteer'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'
Plug 'junegunn/vim-journal'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-line' | Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'Chun-Yang/vim-textobj-chunk' | Plug 'jceb/vim-textobj-uri' | Plug 'reedes/vim-textobj-sentence'
Plug 'kana/vim-textobj-function' | Plug 'thinca/vim-textobj-function-javascript' | Plug 'reedes/vim-textobj-quote'
" Plug 'machakann/vim-textobj-delimited' TODO
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/whitespaste.vim' " claims integrates with vim-pasta TODO: verify
Plug 'AndrewRadev/undoquit.vim'
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
Plug 'vitalk/vim-simple-todo'
Plug 'wellle/targets.vim'
Plug 'mtth/scratch.vim'
Plug 'sunaku/vim-hicterm'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'rhysd/clever-f.vim'
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
Plug 'wincent/terminus'
Plug 'wincent/loupe'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'djdt/pyparens.nvim'
Plug 'Valloric/MatchTagAlways'
Plug 'tweekmonster/braceless.vim'

" search
Plug 'stefandtw/quickfix-reflector.vim'

" neovim specific
Plug 'kassio/neoterm'

" writing
Plug 'junegunn/vim-emoji'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
Plug 'Quramy/vim-js-pretty-template'
Plug 'nono/vim-handlebars'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
" Plug 'sindresorhus/vim-xo'
" Plug 'burnettk/vim-angular', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx'
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'jsx'] }
" typescript
" Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript', 'typescript.tsx']}

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
Plug 'jvanja/vim-bootstrap4-snippets'

" ruby
" Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'eruby', 'yaml'] }
" Plug 'rhysd/vim-textobj-ruby', { 'for': ['ruby', 'eruby', 'yaml'] } TODO: slow?
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby', 'eruby', 'yaml'] }
" Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'yaml'] }
" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'yaml'] }
" Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }
" Plug 'rlue/vim-fold-rspec', { 'for': 'ruby' }

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
" Plug 'OrangeT/vim-csharp', { 'for': 'cs' }

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
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'sebdah/vim-delve'

" other apps
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'

" misc lang
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }
" Plug 'exu/pgsql.vim', { 'for': ['sql', 'psql'] }
Plug 'shmup/vim-sql-syntax'
Plug 'cespare/vim-toml'
" Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'chr4/nginx.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'Shirk/vim-gas' " ASM
Plug 'wlangstroth/vim-racket'
Plug 'neovimhaskell/haskell-vim'
Plug 'enomsg/vim-haskellConcealPlus'

Plug 'tpope/vim-dadbod'
Plug 'plasticboy/vim-markdown'
Plug 'Shougo/vinarise.vim' " hex
Plug 'junegunn/vader.vim'
Plug 'baverman/vial'
Plug 'baverman/vial-http'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'fncll/wordnet.vim'
Plug 'chrisbra/csv.vim'
Plug 'xavierchow/vim-sequence-diagram'
Plug 'gabebw/vim-github-link-opener'
Plug 'mhinz/vim-grepper'
" Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-quicklink'
Plug 'wellle/visual-split.vim'
Plug 'AndrewRadev/exercism.vim'

Plug 'vim-scripts/Mark--Karkat'

" Plug 'bkad/CamelCaseMotion'
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
