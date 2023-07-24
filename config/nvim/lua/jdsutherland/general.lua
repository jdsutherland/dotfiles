local g = vim.g
local opt = vim.opt

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.g.netrw_liststyle = 3

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
opt.history = 10000
opt.statusline = "%t"
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.showmatch = true
opt.wrap = true
-- TODO: set this for noncode files (help etc)
-- opt.breakindent = true
opt.linebreak = true
opt.wildmode = "longest:full"
opt.wildignore:append("tmp/**")
vim.opt.spellfile = os.getenv('HOME') .. "/.config/nvim/spell/en.utf-8.add"
vim.opt.thesaurus = os.getenv('HOME') .. "/.config/nvim/spell/thesaurus/mthesaur.txt"
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
opt.undofile = true
opt.swapfile = false

opt.foldmethod = "expr"
-- TODO: does this default and ufo overrides?
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
opt.showmode = false
opt.iskeyword:append("-")

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300



-- TODO: keep?
-- opt.completeopt:remove("preview")
-- TODO: not sure what this is for?
-- opt.formatoptions = "qrn1"
-- opt.formatoptions:remove("cro")

vim.cmd 'cabbrev vsf vert sfind'
