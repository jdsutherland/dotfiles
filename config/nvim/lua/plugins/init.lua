local utils = require("jdsutherland.utils")
local nnoremap = utils.nnoremap

return {
  { 'ethanholz/nvim-lastplace', config = true },
  { 'NvChad/nvim-colorizer.lua', config = true },
  { 'mcauley-penney/tidy.nvim', config = true },
  { 'gbprod/stay-in-place.nvim', config = true },
  { "folke/todo-comments.nvim", opts = {} },
  {
    'Mr-LLLLL/interestingwords.nvim',
    opts = {
      colors = { '#9999ff', '#ffb3ff', '#ff7272', '#ffd65c', '#99ffb3', '#a8957e', '#fff6cc' },
      navigation = true, -- search icon w/ count for hlsearch
      color_key = "<space>h",
      cancel_color_key = "<space>H",
      search_key = nil,
      cancel_search_key = nil,
    }
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
      -- TODO: use il, ae (maybe)
      useDefaultKeymaps = true
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
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" },
    opts = { execution_message = { enabled = false } },
  },
  {
    'windwp/nvim-autopairs', config = function()
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
  -- 'wellle/targets.vim',
  'tpope/vim-unimpaired',
  'tpope/vim-vinegar',
  'tpope/vim-ragtag',
  {
    'tpope/vim-dadbod',
    dependencies = { 'kristijanhusak/vim-dadbod-ui' }
  },
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
      'rbong/vim-flog',
    }
  },
  {
    'AndrewRadev/switch.vim',
    cmd = "Switch",
    keys = { { "-", "<cmd>Switch<cr>", desc = "Switch" } },
  },
}
