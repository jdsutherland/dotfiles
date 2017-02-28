" yankstack workaround
call yankstack#setup()
nnoremap Y y$
nmap <space>p <Plug>yankstack_substitute_older_paste
nmap <space>P <Plug>yankstack_substitute_newer_paste

" ---GENERAL---
map Q @q
nnoremap <cr>x :xall<cr>
nnoremap <cr>D :qall!

" Reselect pasted text. Mnem: 'Get pasted'
nnoremap gp '[v']
" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.

" ---SWITCHEROOs---
" default to unimpaired paste auto indent
nnoremap <leader>p :call <SNR>96_putline(']p', 'Below')<CR>=']
nnoremap <leader>P :call <SNR>96_putline('[p', 'Above')<CR>=']

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

" META. NOTE: tmux uses: [b,j,l,k,p,i,q]
" others: [a]
nnoremap <M-o> <C-W>p
nnoremap <M-s> :FzfSnippets<CR>
inoremap <expr> <M-[> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
map <M-d> vacjd
nnoremap <M-f> :FzfFiles<CR>
nnoremap <M-h> :VtrSendCommandToRunner<space>
nnoremap <M-y> :VtrSendCommandToRunner<space><cr>
nnoremap <M-t> :VtrFocusRunner<CR><c>c :TmuxNavigatePrevious<CR>
nnoremap <M-r> :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap <M-x> :VtrKillRunner<cr>
nnoremap <M-w> :FzfWindows<CR>
nnoremap <M-/> :FzfMarks<CR>
nnoremap <M-\> :TmuxNavigatePrevious<cr>
nnoremap <M-g> :ToggleGStatus<cr>
nnoremap <silent><M-9> :tabprev<cr>
nnoremap <silent><M-0> :tabnext<cr>
" hacky way to lookup dot chain native modules easily in Dash
map <M-m> viwf.ey;Dash <C-R>"<CR>

nnoremap <cr>d :nohls<CR>
nnoremap <silent> <space>dd :call CloseWindowOrKillBuffer()<CR>
nnoremap <silent><leader>w :%s/\t/  /<cr>
nnoremap <silent> \e :Errors<CR>
vnoremap . :norm.<CR>

nnoremap co<bar> :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap <leader>ea <C-w><C-v><C-l>:e ~/.vim/plugged/vim-snippets/UltiSnips/

" get filepath + name
nnoremap <silent>,cf :let @* = expand("%:~")<CR>
nnoremap <silent>,cn :let @* = expand("%:t")<CR>

" replace with system clipboard
nmap ,gr "*gr

nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sub :%s///g<left><left>
vnoremap <Leader>sub :s///g<left><left>
nnoremap <leader>wub :%s/<C-r><C-w>//gc<left><left><left>
nnoremap <cr>r :s/<C-r><C-w>//<left>

" ---INSERTs---
imap ,rr =>
imap ,aa ->
imap ,uu __
imap ,. />

" ---NAVIGATION---
" open prev buffer
nnoremap <c-b> <C-^>
nnoremap <silent> ,f <C-]>zz
nnoremap <silent>,T :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> ,fs :sp<CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>
nnoremap <silent> ,fv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz<C-w><C-p>
nnoremap <silent> <space>ll :exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>lc :pclose<CR>
nnoremap <silent> ,vs   :vert stag<space>

nnoremap <space>D :bd<CR>
nnoremap <space>z za
nnoremap <leader>N :set nonumber!<CR>:set norelativenumber!<CR>

nnoremap <leader>hp :!open -a Google\ Chrome %<CR><CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <leader>L :set list!<CR>

" splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
" vertical to horizontal ( | -> -- )
noremap <c-w>-  <c-w>t<c-w>K
" horizontal to vertical ( -- -> | )
noremap <c-w>\|  <c-w>t<c-w>H
noremap <c-w>\  <c-w>t<c-w>H
noremap <c-w>/  <c-w>t<c-w>H

" tabs
nnoremap <silent> <space>tc :tabclose<CR>gT
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
nnoremap <space>gA :Git add .<CR>
nnoremap <silent><space>gg :ToggleGStatus<CR>:silent! <C-U>execute <SNR>111_StageNext(v:count1)<CR>zz
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
nnoremap <space>g :Gdiff<cr>
" close a fugitive :Gdiff
nnoremap <space>G <c-w>h<c-w>c
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
" hacky way to lookup dot chain native modules easily in Dash
map <cr>k viwf.ey;Dash <C-R>"<CR>

" argwap
nnoremap <silent> <leader>a :ArgWrap<CR>

" titlecase
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-s><c-f> <plug>(fzf-complete-path)
imap <c-s><c-j> <plug>(fzf-complete-file-ag)
imap <c-s><c-l> <plug>(fzf-complete-line)
" Advanced customization using autoload functions
inoremap <expr> <c-s><c-k> fzf#vim#complete#word({'left': '15%'})
nnoremap <silent> ,t :FzfFiles<CR>
nnoremap <silent> <cr>b :FzfBuffers<CR>
nnoremap <silent> ,ss :FzfSnippets<CR>
nnoremap <silent> ,fw :FzfWindows<CR>
nnoremap <silent> ,bL :FzfBLines<CR>
nnoremap <silent> ,bl :FzfLines<CR>
nnoremap <silent> ,o :FzfBTags<CR>
nnoremap <silent> ,O :FzfTags<CR>
nnoremap <silent> ,ht :FzfHelptags<CR>
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

" vim-plug
nnoremap <silent>,pu :PlugUpdate<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" align inner indent
nmap <cr>a viiga<space>
" sort inner indent
nmap <cr>s viigs
" hack to sort and align current indent (useful css)
nmap <cr>as viiga<space>gvgs

nnoremap <cr>q :VtrSendCommandToRunner<space>
nnoremap <cr><tab> :VtrFocusRunner<cr>

" visual grab entire function
nmap <cr>j vil%
" split carriage returns
nnoremap <cr>0 /\r<cr>s<cr><esc>df<space>

" tmuxnav
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" ruby
nnoremap <leader>R :VtrSendCommandToRunner rake<cr>
nmap <leader>bp orequire "pry"; binding.pry<esc>^
" hack for constructor assignment
nmap <cr>c yiWi@<esc>A<space>=<space><C-R>"<esc>
nnoremap <cr>v :AV<cr>

" test bindings
nnoremap <silent> <space>tt :TestNearest<CR>
nnoremap <silent> <space>ts :TestSuite<CR>
nnoremap <silent> <space>tf :TestFile<CR>
nnoremap <silent> <space>tl :TestLast<CR>
nnoremap <silent> <space>tv :vsp<CR>:exec ':TestVisit'<CR>

" tmux runner
" nnoremap <leader>ar :VtrReattachRunner<cr>
nnoremap <leader>sr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
nnoremap <leader>or :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap <leader>sf :w<cr>:call SendFileViaVtr()<cr>
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<cr>
" open a git log diff
nnoremap <leader>gd :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'gld'}<cr>
nnoremap <leader>sd :VtrSendCtrlD<cr>
nmap <CR>f :VtrSendLineToRunner<cr>
vmap <CR>f <Esc>:VtrSendSelectedToRunner<cr>

" javascript
nnoremap <leader>nr :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'node'}<cr>
nmap ,cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
" ||=
nmap <leader>\| yiWA<space>=<space><C-R>"<space>\|\|<space>
nmap <leader>; A;<ESC>
nmap <leader>, A,<ESC>
" open current file in devtool chrome debugger
nnoremap <leader>jsd :! devtool % &<CR>
nmap <leader>jd odebugger;<esc>^
" hack for this assignment
nmap <cr>t yiWithis.<esc>A<space>=<space><C-R>";<esc>
" require to import
nmap r2i :<C-U>s/\(const\) \(\w*\)\s*=\srequire(\('.*'\))/import \2 from \3<CR>

" splitjoin
nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>

" characterize
nmap gA <Plug>(characterize)

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

" make common changes faster
map <leader>ww ciw
map <leader>vv viW
map <leader>cx cxiw
map <leader>ct ct_
map <leader>dd daw
map <leader>da vacjd
map <leader>df dip
map <leader>cc cip
map gy yiw
map <cr>g griw
" replace line with under cursor
nmap <cr>C yiwcc<c-r>0<esc>
nnoremap <space>- :TabooRename<space>
nnoremap <space>3 :Autoformat<cr>

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
map ,<space> ysiw<space><space>
