return {
  { 'folke/neodev.nvim', config = true },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'},
      {'ray-x/lsp_signature.nvim', opts = { transparency = 10 }},
      -- {'hrsh7th/cmp-nvim-lsp-signature-help'},
    },
    config = function()
      local lsp = require("lsp-zero").preset({})

      lsp.ensure_installed({
        "tsserver",
      })

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        local _ = vim.lsp

        vim.keymap.set("n", "gd", _.buf.definition, opts)
        vim.keymap.set("n", "gs", _.buf.signature_help, opts) -- TODO: keep?
        vim.keymap.set("n", "<c-f>", _.buf.hover, opts)
        vim.keymap.set("i", "<F6>", _.buf.signature_help, opts)
        vim.keymap.set("n", "<space>vws", _.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<space>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<space>vca", _.buf.code_action, opts)
        vim.keymap.set("n", "<space>vrr", _.buf.references, opts)
        vim.keymap.set("n", "<space>vi", _.buf.implementation, opts) -- TODO: keep?
        vim.keymap.set("n", "<space>vrn", _.buf.rename, opts)
        vim.keymap.set('n', '<space>vtd', _.buf.type_definition, opts)
      end)

      -- Fix Undefined global 'vim'
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      local cmp = require("cmp")
      local cmp_action = require('lsp-zero').cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()
      require'luasnip'.filetype_extend("ruby", {"rails"})

      cmp.setup({

        -- Make the first item in completion menu always be selected.
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },

        sources = {
          {name = "path"},
          {name = "nvim_lsp"},
          {name = "nvim_lua"},
          {name = "buffer", keyword_length = 3},
          {name = "luasnip", keyword_length = 2},
          -- {name = 'nvim_lsp_signature_help'}
        },
        mapping = {
          ["<C-f>"] = function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end,
          -- Navigate between snippet placeholder
          -- TODO: see if this conflicts w/ tmux
          ['<C-j>'] = cmp_action.luasnip_jump_forward(),
          ['<C-k>'] = cmp_action.luasnip_jump_backward(),
        }
      })

      -- TODO: move to telescope?
      vim.keymap.set('n', '<space>fd', require('telescope.builtin').lsp_document_symbols)
      vim.keymap.set('n', '<space>fw', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    end
  },
  { 'rmagatti/goto-preview',
    keys = {
      { '<space>ll', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
      { '<space>lr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>" },
      { '<space>lt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>" },
      { '<space>li', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
      { '<space>lc', "<cmd>lua require('goto-preview').close_all_win()<CR>" },
    },
    config = true
  },
  {
    'simrat39/symbols-outline.nvim',
    keys = { {"<localleader>z", "<cmd>SymbolsOutline<cr>"} },
    opts = {
      preview_bg_highlight = 'NormalFloat',
      auto_preview = true,
      autofold_depth = 1,
      -- symbol_blacklist = {
      --   'File',
      --   'Module',
      --   'Namespace',
      --   'Package',
      --   'Class',
      --   'Method',
      --   'Property',
      --   'Field',
      --   'Constructor',
      --   'Enum',
      --   'Interface',
      --   'Function',
      --   'Variable',
      --   'Constant',
      --   'String',
      --   'Number',
      --   'Boolean',
      --   'Array',
      --   'Object',
      --   'Key',
      --   'Null',
      --   'EnumMember',
      --   'Struct',
      --   'Event',
      --   'Operator',
      --   'TypeParameter',
      --   'Component',
      --   'Fragment',
      -- },
    }
  },
  -- { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', opts = {}, },
  -- {
  --   -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     { 'williamboman/mason.nvim', config = true },
  --     'williamboman/mason-lspconfig.nvim',

  --     -- Useful status updates for LSP
  --     { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --   },
  -- },
  -- {
  --   -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',

  --     -- Adds LSP completion capabilities
  --     'hrsh7th/cmp-nvim-lsp',

  --     -- Adds a number of user-friendly snippets
  --     'rafamadriz/friendly-snippets',
  --   },
  -- }
}
