local g = vim.g
local opt = vim.opt

g.mapleader = ','
g.maplocalleader = '\\'
g.netrw_liststyle = 3

opt.smarttab = true
opt.autowrite = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.shortmess = "aoOtIc"
opt.pumheight = 20
opt.tabstop = 2
opt.mouse = ""
opt.conceallevel = 2
opt.smartindent = true
opt.autoindent = true
opt.scrolloff = 3
opt.visualbell = true
opt.lazyredraw = true
opt.history = 10000
opt.updatetime = 250
-- TODO: trying lower amount
opt.timeoutlen = 300
opt.statusline = "%t"
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.showmatch = true
opt.wrap = true
opt.linebreak = true
opt.wildmode = "longest:full"
opt.wildignore:append("tmp/**")
opt.spellfile = "~/.vim/spell/en.utf-8.add"
opt.thesaurus = "~/.vim/spell/thesaurus/mthesaur.txt"
opt.undofile = true
opt.swapfile = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 1

opt.splitbelow = true
opt.splitright = true
opt.diffopt:append("vertical")
opt.termguicolors = true
opt.listchars = {tab='→\\ ',trail='∙',nbsp='•',eol='¶'}
opt.grepprg = "rg --smart-case --vimgrep"
opt.undodir = "~/.config/nvim/undodir"
opt.showmode = false
opt.iskeyword:append("-")

-- TODO: keep?
-- opt.completeopt:remove("preview")
opt.formatoptions = "qrn1"
opt.formatoptions:remove("cro")

vim.cmd 'cabbrev vsf vert sfind'
