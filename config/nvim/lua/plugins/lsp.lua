return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(function() vim.cmd('MasonUpdate') end)
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'},
      {'ray-x/lsp_signature.nvim', opts = {
        transparency = 10,
        hint_enable = true,
        hint_prefix = {
          above = "↙ ",  -- when the hint is on the line above the current line
          current = "← ",  -- when the hint is on the same line
          below = "↖ "  -- when the hint is on the line below the current line
        }
      }},
      -- Disabled: needs Node.js — install via asdf then uncomment
      -- {
      --   "zbirenbaum/copilot.lua",
      --   event = "InsertEnter", -- Lazy load Copilot when entering insert mode
      --   config = function()
      --     require("copilot").setup({
      --       suggestion = {
      --         enabled = true,
      --         auto_trigger = true, -- Automatically show suggestions
      --         debounce = 75,       -- Reduce delay before showing suggestions
      --         keymap = {
      --           accept = "<c-f>",
      --           next = "<c-j>",
      --           prev = "<c-k>",
      --           dismiss = "<C-x>",
      --         },
      --       },
      --       panel = {
      --         enabled = true,
      --         auto_refresh = true
      --       },
      --     })
      --   end,
      -- },
      -- {
      --   "zbirenbaum/copilot-cmp",
      --   after = { "copilot.lua", "nvim-cmp" }, -- Ensure it loads after copilot.lua and nvim-cmp
      --   config = function()
      --     require("copilot_cmp").setup()
      --   end,
      -- },
    },
    config = function()
      -- Set up on_attach for keybindings and other settings
      local on_attach = function(client, bufnr)
        -- Default keymaps (replaces lsp-zero.default_keymaps)
        local function opts_desc(desc)
          return {buffer = bufnr, remap = false, desc = desc}
        end
        local _ = vim.lsp

        vim.keymap.set("n", "gd", _.buf.definition, opts_desc('Goto Definition (LSP)'))
        vim.keymap.set("n", "<localleader>sh", _.buf.signature_help, opts_desc("Signature help")) -- TODO: keep?
        vim.keymap.set("n", "<c-f>", _.buf.hover, opts_desc('Hover'))
        vim.keymap.set("i", "<F6>", _.buf.signature_help, opts_desc('Sig Help'))
        vim.keymap.set("n", "<space>vws", _.buf.workspace_symbol, opts_desc('Workspace Symbol'))
        vim.keymap.set("n", "<space>vd", vim.diagnostic.open_float, opts_desc('Diagnostics Float'))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts_desc('Next Diagnostic'))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts_desc('Previous Diagnostic'))
        vim.keymap.set("n", "<space>vca", _.buf.code_action, opts_desc('Code Action'))
        vim.keymap.set("n", "<space>vrr", _.buf.references, opts_desc('References'))
        vim.keymap.set("n", "<space>vrn", _.buf.rename, opts_desc('Rename'))
        vim.keymap.set('n', '<space>vtd', _.buf.type_definition, opts_desc('Type Definition'))

        -- Telescope bindings for LSP-related searches
        -- TODO: move to telescope?
        vim.keymap.set('n', '<space>fd', require('telescope.builtin').lsp_document_symbols, opts_desc('Document Symbols'))
        vim.keymap.set('n', '<space>fo', function() require("telescope.builtin").lsp_document_symbols({
          symbols = { "method", "function", "class", "struct", "interface" },
          symbol_width = 60
        }) end, opts_desc('Function Symbols'))
        vim.keymap.set('n', '<space>fw', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts_desc('[W]orkspace Symbols'))
      end

      -- Set global defaults for all LSP clients
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = on_attach,
      })

      -- Mason setup for managing external language servers
      require('mason').setup({})

      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'clangd',
          'cssls',
          'gopls',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
          'pyright',
          'rust_analyzer',
          'ruby_lsp',
          'vimls',
          'yamlls',
        },
        handlers = {
          function(server_name)
            vim.lsp.enable(server_name)
          end
        },
      })

      -- Configure the Lua language server (`lua_ls`) for Neovim
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })
      vim.lsp.enable('lua_ls')

      -- Autocompletion setup
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()
      require'luasnip'.filetype_extend("ruby", {"rails"})

      cmp.setup({
        -- Autocomplete menu behavior
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
          -- {name = "copilot", group_index = 2}, -- disabled: needs Node.js
        },
        mapping = {
          ["<C-f>"] = function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end,
          -- Snippet navigation
          ['<C-j>'] = function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<C-k>'] = function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- scroll up and down the documentation window
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }
      })
    end
  },
  { 'rmagatti/goto-preview',
    keys = {
      { '<space>ll', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
      { '<space>lr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>" },
      { '<space>lt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>" },
      { '<space>li', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
      { '<space>lc', "<cmd>lua require('goto-preview').close_all_win()<CR>" },
      -- TODO: improve this. see https://github.com/rmagatti/goto-preview/issues/90
      { '<space>lv', ":vs<cr>:lua require('goto-preview').close_all_win()<CR>zt" },
    },
    opts = {
      height = 15
    }
  },
  {
    'simrat39/symbols-outline.nvim',
    keys = { {"<localleader>z", "<cmd>SymbolsOutline<cr>"} },
    opts = {
      preview_bg_highlight = 'NormalFloat',
      auto_preview = true,
      autofold_depth = 1,
    }
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require("typescript-tools").setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          complete_function_calls = true,
        },
      })
    end,
  },
  { 'folke/lazydev.nvim', config = true },
}
