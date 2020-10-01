nnoremap Y y$

" ---GENERAL---
map Q @q

" Reselect pasted text. Mnem: 'Get pasted'
nnoremap gp '[v']
" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.

" TODO: keep?
" default to unimpaired paste auto indent
nnoremap <leader>p :call <SNR>96_putline(']p', 'Below')<CR>=']
nnoremap <leader>P :call <SNR>96_putline('[p', 'Above')<CR>=']

" ---swaps---
nnoremap ; :
nnoremap : ;
" `` goes to line and column; more useful
nnoremap ' `
nnoremap ` '
" ^ goes to first character; more useful
nnoremap 0 ^
nnoremap ^ 0
" 4 goes to end of line
nnoremap 4 g_
vnoremap 4 g_
vnoremap $ 4
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" show selected line count
vnoremap <c-g> g<c-g>

" META. NOTE: tmux uses: [b,j,l,k,p,i,p,TAB,E,c,C]
" others: [a]
nnoremap <M-e> :VtrFocusRunner<cr>
nnoremap <M-f> :FzfFiles<CR>
nnoremap <M-h> :VtrSendCommandToRunner<space>
" shortcut to mapping a temp runner with
nnoremap ,tb :nnoremap ,t :VtrSendCommandToRunner<space>
nnoremap ,tc :VtrSendCommandToRunner<space>cd `dirname <c-r>%`<cr>
" repeat last command
nnoremap <M-y> :w<esc>:VtrSendCommandToRunner<space><cr>
nnoremap <M-r> :VtrOpenRunner<cr>
nnoremap <M-q> :VtrKillRunner<cr>
nnoremap <M-w> :FzfWindows<CR>
" nnoremap <M-m> :FzfMarks<CR>
nnoremap <silent> <M-s> :ToggleGStatus<cr>
nnoremap <silent><M-9> :tabprev<cr>
nnoremap <silent><M-0> :tabnext<cr>
nnoremap <M-g> :Rg<CR>
imap <m-m> _
cmap <m-m> _
inoremap <m-u> _
imap <M-o> -

nnoremap <silent><cr>d :nohls<CR>
nnoremap <silent> <space>dd :call CloseWindowOrKillBuffer()<CR>
" remove multiple blank lines
nnoremap <silent><leader>W :%!cat -s
" remove semicolons
nnoremap <silent><cr>; :%s/;//<cr>
nnoremap <silent> \e :Errors<CR>
vnoremap . :norm.<CR>

nnoremap co<bar> :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap <leader>ea <C-w><C-v><C-l>:e ~/.config/nvim/plugged/vim-snippets/snippets/

" get filepath + name
nnoremap <silent>,cf :let @* = expand("%:~")<CR>
nnoremap <silent>,cn :let @* = expand("%:t")<CR>

" replace with system clipboard
nmap ,gr "*gr

nnoremap <silent><space>i :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
xnoremap ,* :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
" upcase current word
inoremap <c-u> <esc>viwUe

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sub :%s///<left>
vnoremap <Leader>sub :s///<left>

" search unicode chars
nnoremap <Leader>sun /\v[^\x00-\x7F]+<cr>

" hack to write a file that needs sudo
nnoremap <Leader>sud :w !sudo tee %<cr>
nnoremap <leader>wub :%s/<C-r><C-w>//c<left><left>
nnoremap <Leader>pub :cfdo %s///gc<left><left><left>
nnoremap <cr>l :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr> :s///<left>
nnoremap <cr>L :s///<left>
nnoremap <cr>r :s/<C-r><C-w>//<left>

" ---INSERTs---
inoremap ,rr =>
inoremap ,ar ()<space>=><space>
inoremap ,aa ->
inoremap ,zz <-
inoremap ,uu __
inoremap ,. />
inoremap <c-g> <backspace>

" ---NAVIGATION---
" open prev buffer
nnoremap <c-b> <C-^>
" jump between previous split
nnoremap <M-b> <c-w><c-p>
nnoremap <cr>B <c-w><c-p> :bd!<cr>
nnoremap <silent> ,f <C-]>zz
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap gD :split<cr>gd<c-e><c-e><c-e><c-e><c-e>
nnoremap <silent> <c-t> <c-t>zz
nnoremap <silent>,ft :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
" open tag in split
nnoremap <silent> ,fs :sp<CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>
" open tag in vsplit
nnoremap <silent> ,fv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>
" open ptag cword
nnoremap <silent> <space>ll :exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>lc :pclose<CR>

nmap <expr> <space>z foldclosed('.') != -1 ? 'za' : 'zc'

" toggle all folds
nnoremap <expr> <leader>z &foldlevel ? 'zM' :'zR'
nnoremap <expr> <leader>Z 'zR'

nnoremap <space>D :bd<CR>
nnoremap <tab>n :set nonumber!<CR>:set norelativenumber!<CR>

nnoremap <leader>hp :!open -a Google\ Chrome %<CR><CR>
nnoremap <leader>L :set list!<CR>

" splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
" vertical to horizontal ( | -> -- )
noremap <c-w>-  <c-w>t<c-w>K
" horizontal to vertical ( -- -> | )
noremap <c-w>\|  <c-w>t<c-w>H
noremap <c-w>\  <c-w>t<c-w>H
noremap <c-w>/ :windo wincmd H<cr>

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

" locationlist
nnoremap [w :lprevious<cr>
nnoremap ]w :lnext<cr>

" -- COMPLETION --
" line complete
inoremap <c-l> <c-x><c-l>
" inoremap <expr> <C-F> pumvisible() \|\| &omnifunc == '' ?
" \ "\<lt>C-n>" :
" \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

" vim-plug
nnoremap <silent>,pu :PlugUpdate<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" align inner indent
nmap <cr>i viiga<space>
" sort inner indent
nmap <cr>s viigs
" hack to sort and align current indent (useful css)
nmap <cr>is viiga<space>gvgs

" CR maps
nnoremap <cr>q :VtrSendCommandToRunner<space>
" useful for move up and down paragraph (reading w goyo)
" surround current line with newlines
map <cr><space> [<space>]<space>
" visual from pos to EOL
map <cr>v v4
map <space>v bvE
map <cr>w ciw
map <cr>W ciW
nnoremap <cr>D :qall!

" visual grab entire function
nmap <cr>j vil%
" split carriage returns
nnoremap <cr>0 /\r<cr>s<cr><esc>df<space>

nnoremap <cr>aa :AV<cr>

" append
nmap <leader>; A;<ESC>
nmap <leader>, A,<ESC>
nmap \| A<space>\<ESC>

" TODO: keep?
" nmap <space>: ea:<space>
nmap <space>as ea:<space>
" hack for this assignment
" require to import
nnoremap r2i :<C-U>s/\(const\) \(\w*\)\s*=\srequire(\('.*'\))/import \2 from \3<CR>
" gh url to vim-plug
nmap g2p cvf/ffvBcPlug<space><esc>wviWS'
" toggle conceal
nnoremap <silent><c-f> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=2"<CR>

" hack to fix screen artifacts
nnoremap <silent> <cr>\ :redraw!<cr>

" make common changes faster
" map <leader>ww ciw
map <leader>vv viW
map <leader>cx cxiw
map <leader>ct ct_
map <leader>dd daW
map <leader>da vacjd
map <leader>df dip
map <leader>cc ciW
" map gy yiw
map <cr>g griw
" replace to end of line
map <cr>G gr$
" replace next search with current yanked register
map <cr>n cgn
map <cr>N cgn<c-r>0<esc>

" copy previous paragraph (useful css)
nnoremap <cr>c mz(yap'zpjW

nnoremap <silent><space>L :Limelight!!<cr>
nnoremap <space>- :VtrAttachToPane<cr>
nnoremap <space>1 :PrettyJSON<cr>
nnoremap <space>2 :Goyo<cr>
nnoremap <space>3 :!open %<cr>
nnoremap <space>5 :FZFMru<cr>
nnoremap <space>6 :Rooter<cr>
" display all lines containing word under cursor
nnoremap <silent><space>sd [I

" karabiner coupled hacks
nnoremap <M-S-z> :OpenTmuxGitIndividualFileHistory<cr>
nnoremap <M-S-x> :OpenTmuxGitFileFullHistory<cr>
" HACK: karabiner map <c-i>=>F6 to allow seperate <tab> & <c-i> maps
" TODO: keep?
nnoremap <F6> <C-i>

" paste system clip without added newline above
nmap cV cvgpO<esc>kdd
nmap cv <Plug>SystemPasteLine
nmap cpp cpil
nmap <space>c cp$
" exchange to end of line
nmap cX cx$

" dup line and move W
nnoremap <cr><cr> :t.<cr>W

" Now you can leave the terminal-mode with <Esc>.
" https://stackoverflow.com/questions/47871857/vim-fugitive-with-neovim-terminal-emulator
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

nnoremap <silent> <cr>m :call ResizeMin()<CR>

" shortcut to edit file in the same directory as the current file
cnoremap %% <C-R>=expand("%:p:h").'/'<cr>

" TODO: vimscript
" execute visual selection (works for functions)
vnoremap <c-x> "xy:execute substitute(@x,"\n\\",'','g')<cr>
nnoremap <space>x :execute getline('.')<cr>

" TODO: format paragraph
nnoremap <tab><tab> mz=ap'z

" TODO: make React only
inoremap <c-a> ={}<left>
inoremap <c-q> =""<left>
