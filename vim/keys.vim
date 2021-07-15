nnoremap Y y$
map Q @q

" Reselect pasted text. Mnem: 'Get pasted'
nnoremap gp '[v']
" often 'select previous paste' used to indent; these maps cut out the middleman
nnoremap <space>[ `[V`]<
nnoremap <space>] `[V`]>
" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.

" " ---swaps---
nnoremap ; :
" nnoremap : ; " removed due to https://github.com/AndrewRadev/sideways.vim/issues/40#issuecomment-830693060
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

" META. NOTE: tmux metas: [b,j,l,k,p,i,p,TAB,E,c,C]

nnoremap <silent> \g :ToggleGStatus<cr>
nnoremap <silent><space>9 :tabprev<cr>
nnoremap <silent><space>0 :tabnext<cr>

vnoremap . :norm.<CR>

nnoremap co<bar> :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ea <C-w><C-v><C-l>:e ~/.config/nvim/plugged/vim-snippets/snippets/

" get filepath + name
nnoremap <silent>,cf :let @* = expand("%:~")<CR>
nnoremap <silent>,cn :let @* = expand("%:p")<CR>

" open cword in batgrep
nnoremap \* :call system("tmux splitw -l 30% -h -c \"#{pane_current_path}\" 'batgrep -w -A 7 --smart-case --search-pattern '" . expand("<cword>"))<cr>
nnoremap ,* :Grepper -tool rg -noprompt -cword<CR>

xnoremap ,* :<C-u>call VisualStarSearchSet('/')<CR>:Grepper -tool rg -query <C-R>=@/<CR><CR>
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" Mappings for quick search & replace. Global set to default
" Do a / search first, then leave pattern empty in :s// to use previous
nnoremap <Leader>sub :%s///<left>
vnoremap <Leader>sub :s///<left>

" get count
nnoremap \# :%s///gn<left><left><left><left>

" search unicode chars
nnoremap <Leader>sun /\v[^\x00-\x7F]+<cr>

" hack to write a file that needs sudo
nnoremap <Leader>sud :w !sudo tee %<cr>
nnoremap <leader>wub :%s/<C-r><C-w>//c<left><left>
nnoremap <Leader>pub :cfdo %s///gc<left><left><left>
" replace all <cword> in line
nnoremap <expr> <cr>l ':s/'.expand('<cword>').'//<left>'

" ---NAVIGATION---
" open prev buffer
nnoremap <c-b> <C-^>
" jump between previous split
nnoremap \s <c-w><c-p>
" close recent split
nnoremap ,fd <c-w><c-p> :q<cr>
nnoremap <silent> ,f <C-]>zz
nnoremap <silent>,ft :tab split <CR>:exec("tag ".expand("<cword>"))<CR>
" open tag in split
nnoremap <silent> ,fS :sp<CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>
" open tag in vsplit
nnoremap <silent> ,fV :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>
" open ptag cword
nnoremap <silent> <space>ll :exec("ptag ".expand("<cword>"))<CR>:set sb<CR>
nnoremap <silent> <space>lc :pclose<CR>

" toggle current fold
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
noremap <c-w>- <c-w>t<c-w>K
" horizontal to vertical ( -- -> | )
noremap <c-w>\ <c-w>t<c-w>H

" tabs
nnoremap <silent> <space>tc :tabclose<CR>gT
nnoremap <space>tn :tabnew%<cr>

" {{{ go to tab and window by number (1-9)
function! s:MapGotoWindowAndTabNumber()
   let i = 1
   while i <= 9
       " tabs
       execute 'nnoremap <silent><Leader>' . i . ' :' . i . 'tabn<CR>'
       " window
       execute 'nnoremap <silent><localleader>' . i . ' :' . i . 'wincmd w<CR>'
      let i = i + 1
   endwhile
endfunction
call s:MapGotoWindowAndTabNumber()
" }}}

" locationlist
nnoremap [w :lprevious<cr>
nnoremap ]w :lnext<cr>

" -- COMPLETION --
" line complete
inoremap <c-l> <c-x><c-l>

" split carriage returns
nnoremap <cr>0 /\r<cr>s<cr><esc>df<space>

" append
nnoremap <leader>; A;<ESC>
nnoremap <leader>, A,<ESC>
nmap \| A<space>\<ESC>

" gh url to vim-plug
nmap g2p cvf/ffvBcPlug<space><esc>wviWS'
nnoremap <silent>,pu :PlugUpdate<CR>
" toggle conceal
nnoremap <silent><c-f> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=2"<CR>

nmap <space>v v4
nmap <space>c cp$
nnoremap <silent><space>i :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
nnoremap <space>u :nohls<cr>
nnoremap <space>Q :qall!<cr>

nmap <cr>w ciw
nmap <cr>W ciW
nmap <cr>v viW
nmap <cr>d daW
nmap <cr>n cgn
nmap <cr>N cgn<c-r>0<esc>
nnoremap <cr><space> :w<cr>
" copy previous paragraph (useful css)
nnoremap cpp mz(yap'zpjW

nnoremap <space>1 :!open %<cr>
" karabiner coupled hacks
nnoremap <M-S-z> :TmuxGitIndividualFileHistory<cr>
nnoremap <M-S-x> :TmuxGitFileFullHistory<cr>
" HACK: karabiner map <c-i>=>F6 to allow seperate <tab> & <c-i> maps
nnoremap <F6> <C-i>

" paste system clip without added newline above
nmap cV cvgpO<esc>kdd
nmap cv <Plug>SystemPasteLine

" dup line and move W
nnoremap <cr><cr> :t.<cr>W

" Now you can leave the terminal-mode with <Esc>.
" https://stackoverflow.com/questions/47871857/vim-fugitive-with-neovim-terminal-emulator
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

nnoremap <tab><tab> mz=ap'z:delmark z<cr>

" gf in vsplit
nnoremap <c-w>v :vertical wincmd f<CR>

" {{{ imode
inoremap ,rr =>
inoremap ,ar ()<space>=><space>
inoremap ,aa ->
inoremap ,zz <-
inoremap ,uu __
inoremap ,. />

" upcase current word
inoremap <c-u> <esc>viwUe
imap <m-m> _
inoremap <c-d> <backspace>
" }}}

" {{{ cmode
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-d> <backspace>
cnoremap <c-a> <home>
cmap <m-m> _

" move word but keep default popupmenu
cnoremap <expr><c-p> pumvisible() ? "\<C-p>" : "\<c-right>"
cnoremap <expr><c-n> pumvisible() ? "\<C-n>" : "\<c-left>"

" shortcut to edit file in the same directory as the current file
cnoremap %% <C-R>=expand("%:p:h").'/'<cr>

" <c-f> is like tab completion in cmode
function! s:wildchar()
    call feedkeys("\<Tab>", 'nt')
    return ''
endfunction
cnoremap <silent> <c-f> <C-r>=<SID>wildchar()<CR>

" <c-q> edit mode
cnoremap <silent> <c-q> <c-f>
" }}}

" force top correction on most recent misspelling
nnoremap <buffer> <c-s> [s1z=
inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

nnoremap <c-g> 1<c-g>
