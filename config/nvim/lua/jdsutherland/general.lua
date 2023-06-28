vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.opt.smarttab = true
vim.opt.autowrite = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shortmess = "aoOtIc"
vim.opt.pumheight = 20
vim.opt.tabstop = 2
vim.opt.mouse = ""
vim.opt.conceallevel = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.scrolloff = 3
vim.opt.visualbell = true
vim.opt.lazyredraw = true
vim.opt.history = 10000
vim.opt.updatetime = 250
-- TODO: trying lower amount
vim.opt.timeoutlen = 300
vim.opt.statusline = "%t"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.showmatch = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.wildmode = "longest:full"
vim.opt.wildignore:append("tmp/**")
vim.opt.spellfile = "~/.vim/spell/en.utf-8.add"
vim.opt.thesaurus = "~/.vim/spell/thesaurus/mthesaur.txt"
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 1

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.diffopt:append("vertical")
vim.opt.termguicolors = true
vim.opt.listchars = {tab='→\\ ',trail='∙',nbsp='•',eol='¶'}
vim.opt.grepprg = "rg --smart-case --vimgrep"
vim.opt.undodir = "~/.config/nvim/undodir"
vim.opt.showmode = false
vim.opt.iskeyword:append("-")
vim.g.netrw_liststyle = 3
vim.cmd 'cabbrev vsf vert sfind'
vim.cmd 'colorscheme kanagawa-dragon'

-- TODO: keep?
-- vim.opt.completeopt:remove("preview")
vim.opt.formatoptions = "qrn1"
vim.opt.formatoptions:remove("cro")
