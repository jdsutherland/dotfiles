return {
  {
    -- overloads h & l to quickly fold
    "chrisgrieser/nvim-origami",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    opts = true, -- needed even when using default config
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    -- TODO: try oxi
    'nvim-pack/nvim-spectre',
    opts = {},
    cmd = "Spectre",
    keys = {
      { '<leader>S', function() require("spectre").toggle() end, desc = "Toggle Spectre" },
      { '<leader>sw', function() require("spectre").open_visual({select_word=true}) end, mode = 'n', desc = "Search current word" },
      { '<leader>sw', function() require("spectre").open_visual() end, mode = 'v', desc = "Search current word" },
      { '<leader>sp', function() require("spectre").open_file_search({select_word=true}) end, desc = "Search in current file" }
    }
  },
  { 'ethanholz/nvim-lastplace', config = true },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = { names = false }
    }
  },
  { 'mcauley-penney/tidy.nvim', config = true },
  { 'gbprod/stay-in-place.nvim', config = true },
  { "folke/todo-comments.nvim", opts = {} },
  { 'folke/tokyonight.nvim', opts = { dim_inactive = true }, lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { 'rose-pine/neovim', name = 'rose-pine', opts = { dim_nc_background = true }, lazy = true },
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
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({ event = "InsertEnter" })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  'jghauser/mkdir.nvim',
  {
    'mrjones2014/dash.nvim',
    run = 'make install',
    cmd = { 'Dash', 'DashWord' },
    keys = { {'<space>gk', '<cmd>DashWord<cr>'} }
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = { {'<localleader>G', '<cmd>:LazyGit<cr>'} }
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
  -- =========== vimscript plugins ===========
  {
    'rhysd/git-messenger.vim',
    dependencies = 'mattn/webapi-vim',
    keys = { {'<space>m', '<Plug>(git-messenger)'} },
    config = function ()
      vim.cmd([[
      let g:git_messenger_floating_win_opts = { 'border': 'single' }
      let g:git_messenger_popup_content_margins = v:false
      let g:git_messenger_always_into_popup = v:true
      let g:git_messenger_date_format = "%Y %b %d %X"
      ]])
    end
  },
  'troydm/zoomwintab.vim',
  'jdsutherland/vim-github-link-opener',
  'christoomey/vim-system-copy',
  'vim-scripts/ReplaceWithRegister',
  'vim-scripts/ReplaceWithSameIndentRegister',
  'tpope/vim-apathy',
  'tpope/vim-dispatch',
  'tpope/vim-dotenv',
  'tpope/vim-repeat',
  'tpope/vim-scriptease',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'tpope/vim-ragtag',
  'tpope/vim-rails',
  'AndrewRadev/tagalong.vim',
  'tommcdo/vim-exchange',
  {
    'tpope/vim-dadbod',
    dependencies = { 'kristijanhusak/vim-dadbod-ui' },
    cmd = { 'DB' }
  },
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
      { 'rbong/vim-flog', cmd = { 'Flog' } },
    },
    cmd = { "Git", "GBrowse", "Gread" }
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
  },
  {
    'mbbill/undotree',
    keys = { { '<leader>u', '<cmd>UndotreeToggle<cr>' } },
    config = function() vim.g.undotree_SetFocusWhenToggle = 1 end
  },
}
