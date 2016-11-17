" ---GENERAL---
map Q @q
nnoremap Y y$

" Reselect pasted text. Mnem: 'Get pasted'
nnoremap gp '[v']
" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.

" ---SWITCHEROOs---
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

nnoremap <cr><cr> :nohls<CR>
nnoremap <silent> <space>dd :call CloseWindowOrKillBuffer()<CR>
nnoremap <silent><leader>w :call StripTrailingWhitespaces()<CR>
nmap <script> <silent> \\ :call ToggleQuickfixList()<CR>
nnoremap <silent> \d :lcl<CR>
nnoremap <silent> \e :Errors<CR>
vnoremap . :norm.<CR>

nnoremap co<bar> :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ea <C-w><C-v><C-l>:e ~/.vim/bundle/vim-snippets/UltiSnips/
inoremap <expr> <C-S> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

" get filepath + name
nnoremap <silent>,cf :let @* = expand("%:~")<CR>
nnoremap <silent>,cn :let @* = expand("%:t")<CR>
nnoremap <leader>dd :read !date<CR>
nnoremap <leader>rr :!!<CR>

" replace with system clipboard
nmap ,gr "*gr

nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sub :%s///g<left><left>
vnoremap <Leader>sub :s///g<left><left>
nnoremap <leader>wub :%s//<C-r><C-w>/g<cr>

" ---INSERTs---
imap ,rr <space>=><space>
imap ,aa ->
imap ,uu __

" ---NAVIGATION---
" open prev buffer
nnoremap <cr>b <C-^>
" Karabiner cmd_l to previous spit
nnoremap <silent> ,f <C-]>zz
nnoremap <silent>,T :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> ,fs :sp<CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>
nnoremap <silent> ,fv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>
nnoremap <silent> <space>ll :exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>lc :pclose<CR>
nnoremap <silent> ,vs   :vert stag<space>
" Create window splits easier.
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
nnoremap <space>D :bd<CR>
nnoremap <space>z za
nnoremap <leader>N :set nonumber!<CR>:set norelativenumber!<CR>

nnoremap <leader>hp :!open -a Google\ Chrome %<CR><CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <leader>L :set list!<CR>

" tabs
nnoremap <silent> <space>tc :tabclose<CR>
nnoremap <leader>wn :tabnew%<cr>
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

" -----PLUGIN------

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :ToggleGStatus<CR>
nnoremap <space>gS :Gministatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gB :Gbrowse<CR>
nnoremap <space>gp :Git add --patch<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>
nnoremap <space>gL :GitLog<space>
nnoremap <space>gP :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gbr :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
command! GdiffInTab tabedit %|Gdiff
nnoremap <space>gD :Gdiff<cr>
nnoremap <space>gd :GdiffInTab<cr>
nnoremap <space>dt :diffthis<cr>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dp :diffput<space>
nnoremap <leader>dg :diffget<space>

" tagbar
nnoremap <silent> ,zz :TagbarToggle<CR>
nnoremap <silent> ,xx :TagbarOpen fj<CR>
nnoremap <silent> ,zx :TagbarTogglePause<CR>

" dash
nnoremap gk :Dash<CR>

" argwap
nnoremap <silent> <leader>a :ArgWrap<CR>

" fzf
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

" vim-resize - resizes splits
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>

" vim-todo
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

" EasyAlign
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" tmuxnav
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" ruby rspec/tmux runner
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<cr>
nmap <leader>bp orequire 'pry'; binding.pry<esc>^

" javascript
nmap ,cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^

" test bindings
nnoremap <silent> <space>tt :TestNearest<CR>
nnoremap <silent> <space>ts :TestSuite<CR>
nnoremap <silent> <space>T :TestFile<CR>
" nnoremap <silent> <leader>a :TestSuite<CR>
" nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <space>tv :vsp<CR>:exec ':TestVisit'<CR>

" splitjoin
nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>

" lldb
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

" ----SURROUND----
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`
