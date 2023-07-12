local utils = require("jdsutherland.utils")
local nnoremap = utils.nnoremap

return {
  { 'ethanholz/nvim-lastplace', config = true },
  { 'kazhala/close-buffers.nvim', cmd = 'BDelete' },
  { 'NvChad/nvim-colorizer.lua', config = true },
  { 'mcauley-penney/tidy.nvim', config = true },
  { 'gbprod/stay-in-place.nvim', config = true },
  { "folke/todo-comments.nvim", opts = {} },
  { 'folke/tokyonight.nvim', opts = { dim_inactive = true }, lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('headlines').setup()
      vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
    end
  },
  {
    'axkirillov/hbac.nvim',
    config = true,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = { plugins = {
      tmux = true,
      alacritty = { enabled = true, font = "15" },
    } },
    keys = { { "<c-w>t", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "folke/which-key.nvim", opts = {},
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
    end,
  },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = { execution_message = { enabled = false } },
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({ event = "InsertEnter" })
    end
  },
  'jghauser/mkdir.nvim',
  -- =========== vimscript plugins ===========
  'troydm/zoomwintab.vim',
  'jdsutherland/vim-github-link-opener',
  'christoomey/vim-system-copy',
  'vim-scripts/ReplaceWithRegister',
  'vim-scripts/ReplaceWithSameIndentRegister',
  'tpope/vim-apathy',
  'tpope/vim-dispatch',
  'tpope/vim-dotenv',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-scriptease',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'tpope/vim-vinegar',
  'tpope/vim-ragtag',
  {
    'tpope/vim-dadbod',
    dependencies = { 'kristijanhusak/vim-dadbod-ui' },
    cmd = { 'DB' }
  },
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
      'rbong/vim-flog',
    },
    cmd = { "Git", "Git blame", "GBrowse" }
  },
  {
    'AndrewRadev/switch.vim',
    cmd = "Switch",
    keys = { { "-", "<cmd>Switch<cr>", desc = "Switch" } },
  },
  {
    -- TODO: implement this using tree-sitter
    'AndrewRadev/sideways.vim',
    keys = {
      { '<leader>aa', '<Plug>SidewaysArgumentAppendAfter', desc = 'Append arg at pos' },
      { '<leader>aj', '<Plug>SidewaysArgumentAppendLast', desc = 'Append last arg' },
    }
  }
}
