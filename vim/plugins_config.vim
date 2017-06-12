" ag
let g:ag_prg='true ; f(){ ag --column "$@" \| cut -c 1-'.(&columns - 6).' }; f'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" gist
let g:gist_post_anonymous = 1

" resize
let g:vim_resize_disable_auto_mappings = 1

" psql
let g:sql_type_default = 'pgsql'

" togglelist
let g:lt_location_list_toggle_map = '\d'
let g:lt_quickfix_list_toggle_map = '\\'

" easymotion
let g:EasyMotion_leader_key = '<M-u>'

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'

" poppy - rainbow parens
augroup Poppy
  au!
augroup END
nnoremap <silent><leader>\  :call clearmatches() \| let g:poppy = -get(g:,'poppy',-1) \|
      \ exe 'au! Poppy CursorMoved *' . (g:poppy > 0 ? ' call PoppyInit()' : '') <cr>

" ale linting
let g:ale_fixers = {}
let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow']
      \ }
let g:ale_fixers.javascript = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--no-bracket-spacing --single-quote'

let g:ale_fixers.python = [
      \ 'remove_trailing_lines',
      \ 'add_blank_lines_for_python_control_statements',
      \ 'isort',
      \ 'autopep8',
      \ 'yapf']

" TODO do i want this?
let g:ale_ruby_rubocop_options = '--rails --display-style-guide'

nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)
" Linting on all changes felt too aggressive. The below settings calls lint on
" certain events, either when I stop interacting or when entering / leaving
" insert mode
set updatetime=1000
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertLeave * call ale#Lint()
autocmd TextChanged * call ale#Lint()
let g:ale_lint_on_text_changed = 0
let g:ale_linter_aliases = {
      \ 'zsh': 'sh'
      \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
set statusline+=%=
set statusline+=\ %{ALEGetStatusLine()}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" omnisharp - dotnet
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_server_type = 'v1'
" let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 100

" monster - ruby
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

" ruby textobj
let g:textobj_ruby_more_mappings = 1

" tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30

" rspec
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets='<C-s>'

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_core_mode = 'external_command'

" fzf
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'ctrl-enter,ctrl-s'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" fix black color
hi Number ctermfg=14

let g:fzf_commits_log_options =
\ '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" let g:rg_command = 'rg --follow --ignore-case --column --line-number --no-heading --color -j 8 "always"  -g "*.js" -g "*.json" -g "*.php" -g "*.md" -g "*.styl" -g "*.scss" -g "*.sass" -g "*.pug" -g "*.html" -g "*.config" -g "*.py" -g "*.cpp" -g "*.c" -g "*.go" -g "*.hs" -g "*.rb" -g "*.conf" -g "*.vim" -g "*.sh" -g "*.txt" -g "!.git/**" -g "!node_modules/**" -g "!vendor/**" -g "!build/**" -g "!plugged/**" -g "!*.lock" '

let g:rg_command = 'rg --hidden --follow --column --line-number --no-heading -j 8 --smart-case --color "always"
\ -g "!{.git,node_modules,vendor,build,plugged,lib,dist}/*"
\ -g "*.{js,jsx,json,php,md,styl,jade,html,css,config,py,cpp,c,go,hs,rb,erb,conf,hbs,sh,vim}"
\ -g "!*.{lock,min.js,swp,o,zip}" '

" TODO?(if desired): whitelist of filetypes

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_command .shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:70%:hidden')
  \           : fzf#vim#with_preview('right:50%', ';'),
  \   <bang>0)

" [Files] Extra options for fzf
"   e.g. File preview using Highlight
"        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" fzf mru files
command! FZFMru call fzf#run({
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

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '\'),
"   \                 <bang>0)



" airline
" let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
" display root buffer/filename instead of full path
let g:airline_section_c = '%t'
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" vim-todo
let g:simple_todo_map_keys = 0

" vim-titlecase
let g:titlecase_map_keys = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_fenced_languages = ['psql=sql', 'js=javascript', 'rb=ruby', 'erb=eruby', 'py=python', 'csharp=cs']

" vim-switch
let g:switch_mapping = "-"

" vim-test
let test#strategy = 'vtr'
let g:test#preserve_screen = 1

" togglelist
let g:toggle_list_no_mappings = 1 " Disable default mappings.

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" clever-f
let g:clever_f_not_overwrites_standard_mappings=1

" writing
let g:languagetool_jar = '/usr/local/Cellar/languagetool/3.6/libexec/languagetool-commandline.jar'
let g:languagetool_lang = 'en-US'
let g:grammarous#languagetool_cmd = 'languagetool'
" let g:lexical#thesaurus_key = '<c-s><c-t>'

let g:tq_mthesaur_file='~/.vim/spell/thesaurus/mthesaur.txt'
nnoremap <c-s><c-t> :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <c-s><c-t> y:ThesaurusQueryReplace <C-r>"<CR>

" rainbow
let g:rainbow_active = 1

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,chai,flux,handlebars,requirejs,sugar,ramda'

" pangloss javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

" jsx
let g:vim_jsx_pretty_colorful_config = 1

" flow
let g:flow#autoclose = 1

" Rappel
let g:rappel#term       = 'vsp | term '
" let g:rappel#term = ' VtrSendCommandToRunner cd $(dirname %:p); '
let g:rappel#launch     = 'chrome %'
let g:rappel#default    = g:rappel#term

let g:rappel#custom_repls = {
\ 'ruby': {
\   'repl': 'pry',
\   'run':  'ruby %',
\ },
\ 'python': {
\   'repl': 'ptpython',
\   'run': 'python %',
\ },
\ 'c': {
\   'compiler': 'gcc % -Wall -g',
\   'run': 'make debug && make dgb || sudo cgdb a.out',
\   'launch': './a.out',
\ },
\}

" scratch
let g:scratch_no_mappings = 1

" autopairs
let g:AutoPairsShortcutJump = ''

" incsearch
" let g:incsearch#auto_nohlsearch = 1

let g:rooter_manual_only = 1

" conflicted
let g:diffget_local_map = ',dgl'
let g:diffget_upstream_map = ',dgu'
