local utils = require("jdsutherland.utils")
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap
local cmap = utils.cmap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap
local cnoremap = utils.cnoremap
local tnoremap = utils.tnoremap

-- NOTE: `vim.cmd` used where wouldn't otherwise work

nnoremap('Y', 'y$')
nmap('Q', '@q')

-- Reselect pasted text. Mnem: 'Get pasted'
nnoremap("gp", "'[v']")
-- often 'select previous paste' used to indent; these maps cut out the middleman
nnoremap("<space>[", "`[V`]<")
nnoremap("<space>]", "`[V`]>")
-- Go to position of last edit. Mnem: 'Go to Edit'
nnoremap("ge", "`.")

-- " ---swaps---
vim.cmd([[nnoremap ; :]])
-- nnoremap : ; " removed due to https://github.com/AndrewRadev/sideways.vim/issues/40#issuecomment-830693060
-- `` goes to line and column; more useful
nnoremap("'", "`")
nnoremap("`", "'")
-- ^ goes to first character; more useful
nnoremap("0", "^")
nnoremap("^", "0")
vnoremap("0", "^")
-- 4 goes to end of line
nnoremap("4", "g_")
vnoremap("4", "g_")

-- move vertically by visual line
nnoremap("j", "gj")
nnoremap("k", "gk")

-- show selected line count
vnoremap("<c-g>", "g<c-g>")

-- META. NOTE: tmux metas: [b,j,l,k,p,i,p,TAB,E,c,C]
nnoremap("<space>9", ":tabprev<cr>")
nnoremap("<space>0", ":tabnext<cr>")

vnoremap(".", ":norm.<CR>")

nnoremap("co<bar>", ":set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 81<CR><CR>")

-- TODO: update this to new snippet?
nnoremap("<leader>ea", "<C-w><C-v><C-l>:e ~/.config/nvim/plugged/vim-snippets/snippets/")

-- get filepath + name
vim.cmd([[
nnoremap <silent>,cf :let @* = expand("%:~")<CR>
nnoremap <silent>,cn :let @* = expand("%:p")<CR>
]])

---- open cword in batgrep
local open_batgrep_in_tmux = [[:call system("tmux splitw -l 30% -h -c \"#{pane_current_path}\" 'batgrep -w -A 7 --smart-case --search-pattern '" . expand("<cword>"))<cr>]] -- .. vim.fn.expand("<cword>") .. [[")<cr>]]
nnoremap([[<localleader>*]], open_batgrep_in_tmux)
---- TODO: move near Grepper
nnoremap("<leader>*", ":Grepper -tool rg -noprompt -cword<CR>")

vim.cmd([[
function! VisualStarSearchSet(cmdtype,...)
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @/ = substitute(@/, '\.', '\\.', 'g')
  let @" = temp
endfunction
xnoremap ,* :<C-u>call VisualStarSearchSet('/')<CR>:Grepper -tool rg -query <C-R>=@/<CR><CR>
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>
]])

-- Mappings for quick search & replace. Global set to default
-- Do a / search first, then leave pattern empty in :s// to use previous
nnoremap([[<localleader>S]], [[:%s///<left>]])
-- replace cword on current line
vim.cmd([[nnoremap <expr><cr>l ':s/'.expand('<cword>').'//<left>']])

-----NAVIGATION---
-- open prev buffer
nnoremap("<c-b>", "<C-^>")
-- jump between previous split
nnoremap([[\s]], [[<c-w><c-p>]])
-- close recent split
nnoremap([[,fd]], [[:Mark<cr><c-w><c-p> :q<cr>]])
nnoremap([[,f]], [[<C-]>zz]])
nnoremap([[,ft]], [[:tab split <CR>:exec("tag ".expand("<cword>"))<CR>]])
-- open tag in split
nnoremap([[,fS]], [[:sp<CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>]])
-- open tag in vsplit
nnoremap([[,fV]], [[:vsp <CR>:exec("tag ".expand("<cword>"))<CR>zt<C-w><C-p>]])
-- open ptag cword
nnoremap([[<space>ll]], [[:exec("ptag "]] .. vim.fn.expand("<cword>") .. [[)<CR>:set sb<CR>]])
nnoremap([[<space>lc]], [[:pclose<CR>]])

-- TODO: doesn't work => find fold map solution
-- toggle current fold
-- vim.api.nvim_set_keymap('n', '<space>z', [[foldclosed('.') ~= -1 and 'za' or 'zc']], { expr = true })
-- -- toggle all folds
-- vim.api.nvim_set_keymap('n', '<leader>z', 'vim.v.foldlevel ~= 0 and "zM" or "zR"', { expr = true })
-- nnoremap([[<leader>Z]], [['zR']])

vim.cmd([[
nmap <expr> <space>zz foldclosed('.') != -1 ? 'za' : 'zc'
nnoremap <expr> <space>z<space> &foldlevel ? 'zM' :'zR'
nnoremap <expr> <space>z 'zA'
]])

nnoremap([[<space>D]], [[:bd<CR>]])
nnoremap([[<tab>n]], [[:set nonumber!<CR>:set norelativenumber!<CR>]])

nnoremap([[<leader>hp]], [[:!open -a Google\ Chrome %<CR><CR>]])
nnoremap([[<leader>L]], [[:set list!<CR>]])

-- splits
nnoremap([[vv]], [[<C-w>v]])
-- vertical to horizontal ( | -> -- )
nnoremap([[<c-w>-]], [[<c-w>t<c-w>K]])
-- horizontal to vertical ( -- -> | )
nnoremap([[<c-w>\]], [[<c-w>t<c-w>H]])

-- {{{ go to tab and window by number (1-9)
for i = 1, 9 do
  -- Tabs
  -- Windows
  nnoremap('<localleader>' .. i, ' :' .. i .. "wincmd w<CR>")
end
-- }}}

-- locationlist
nnoremap([[[w]], [[:lprevious<cr>]])
nnoremap([[]w]], [[:lnext<cr>]])

-- line complete
inoremap([[<c-l>]], [[<c-x><c-l>]])

-- nnoremap([[<leader>;]], [[A;<ESC>]])
nnoremap([[<leader>,]], [[A,<ESC>]])

-- split carriage returns
nnoremap([[<cr>0]], [[/\r<cr>s<cr><esc>df<space>]])

-- TODO: this should probably be a snippet
nmap([[g2p]], [[o<c-r>+<esc>Bdf/df/I'<esc>A'<esc>]])

-- highlight without moving TODO: simplify
nnoremap([[<space>i]], [[:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>]])
nnoremap([[<space>u]], [[:nohls<cr>]])
-- quit
nnoremap([[<space>Q]], [[:qall!<cr>]])

-- convenience
nmap([[<cr>w]], [[ciw]])
nmap([[<cr>W]], [[ciW]])
nmap([[<cr>v]], [[viW]])
nmap([[<cr>d]], [[daW]])
nmap([[<cr>n]], [[cgn]])
nmap([[<cr>N]], [[cgn<c-r>0<esc>]])
nnoremap([[<cr><space>]], [[:w<cr>]])
-- copy previous paragraph (useful css)
nnoremap([[cpp]], [[mz(yap'zpjW]])

-- HACK: karabiner coupled
nnoremap([[<M-S-z>]], [[:TmuxGitIndividualFileHistory<cr>]])
nnoremap([[<M-S-x>]], [[:TmuxGitFileFullHistory<cr>]])
--<c-i>=>F6 to allow seperate <tab> & <c-i> maps
nnoremap([[<F6>]], [[<C-i>]])

-- paste system clip without added newline above
nmap([[cV]], [[cvgpO<esc>kdd]])
nmap([[cv]], [[<Plug>SystemPasteLine]])
nmap([[<leader>gr]], [["*gr]])

-- dup line and move W
nnoremap([[<cr><cr>]], [[:t.<cr>W]])

-- indent paragraph and preserve location
nnoremap([[<tab><tab>]], [[mz=ap'z:delmark z<cr>]])

-- gf in vsplit
nmap([[<c-w>v]], [[<c-w>vgf]])
-- gF (line #) in vsplit
nnoremap([[<c-w>l]], [[<c-w>vgF]])
-- gf in split
nmap([[<c-w>s]], [[<c-w>f]])

-- {{{ imode
inoremap([[<C-A>]], [[<C-O>^]])
-- TODO: what does this do?
inoremap([[<C-X><C-A>]], [[<C-A>]])

-- upcase current word
inoremap([[<c-u>]], [[<esc>viwUe]])
imap([[…]], [[_]]) -- <m-;>
cmap([[…]], [[_]]) -- <m-;>
imap([[“]], [[(]]) -- <m-[>
cmap([[“]], [[(]]) -- <m-[>
imap([[‘]], [[)]]) -- <m-]>
cmap([[‘]], [[)]]) -- <m-]>
-- inoremap([[<c-d>]], [[<backspace>]])
-- }}}

-- move word but keep default popupmenu
vim.api.nvim_set_keymap('c', '<C-p>', [[pumvisible() ? "<C-p>" : "<C-right>"]], { expr = true })
vim.api.nvim_set_keymap('c', '<C-n>', [[pumvisible() ? "<C-n>" : "<C-left>"]], { expr = true })

-- shortcut to edit file in the same directory as the current file
vim.cmd([[cnoremap %% <C-R>=expand("%:p:h").'/'<cr>]])

-- <c-f> is like tab completion in cmode
vim.cmd([[
function! s:wildchar()
    call feedkeys("\<Tab>", 'nt')
    return ''
endfunction
cnoremap <silent> <c-f> <C-r>=<SID>wildchar()<CR>
]])
-- <c-q> edit mode
cnoremap([[<c-q>]], [[<c-f>]])
-- }}}

-- fix cword spelling
nnoremap([[<c-s><c-s>]], [[[s1z=]])
-- fix nearest previous spelling
inoremap([[<c-s><c-s>]], [[<c-g>u<Esc>[s1z=`]A<c-g>u]])

nnoremap([[<c-g>]], [[1<c-g>]])

vnoremap([[<c-w>]], [[<del><del>]])

function close_most_recent_split()
    local current_window = vim.api.nvim_get_current_win()
    vim.cmd('wincmd p | close')
    vim.api.nvim_set_current_win(current_window)
end
_G.close_most_recent_split = close_most_recent_split
nnoremap('<localleader>c', ':lua close_most_recent_split()<CR>')
