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
      {'j-hui/fidget.nvim', opts = {} },
      {'b0o/schemastore.nvim' },
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
      -- Rounded borders on all floating windows (hover, diagnostics, etc.)
      vim.o.winborder = 'rounded'

      -- Diagnostic display: underline always off, signs always on, toggle virtual_text
      vim.diagnostic.config {
        underline = false,
        signs = true,
        virtual_text = false,
        update_in_insert = false,
      }

      -- Set global capabilities for all LSP clients
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      -- LspAttach autocommand: set buffer-local keymaps when LSP client attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then return end
          local bufnr = event.buf

          local function opts_desc(desc)
            return {buffer = bufnr, remap = false, desc = desc}
          end

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_desc('Goto Definition'))
          vim.keymap.set('n', '<c-f>', vim.lsp.buf.hover, opts_desc('Hover'))
          vim.keymap.set('n', '<localleader>sh', vim.lsp.buf.signature_help, opts_desc('Signature help'))
          vim.keymap.set('i', '<F6>', vim.lsp.buf.signature_help, opts_desc('Sig Help'))
          vim.keymap.set('n', '<space>vws', vim.lsp.buf.workspace_symbol, opts_desc('Workspace Symbol'))
          vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float, opts_desc('Diagnostics Float'))
          vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts_desc('Next Diagnostic'))
          vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts_desc('Previous Diagnostic'))
          vim.keymap.set('n', '<space>vca', vim.lsp.buf.code_action, opts_desc('Code Action'))
          vim.keymap.set('n', '<space>vrr', vim.lsp.buf.references, opts_desc('References'))
          vim.keymap.set('n', '<space>vrn', vim.lsp.buf.rename, opts_desc('Rename'))
          vim.keymap.set('n', '<space>vtd', vim.lsp.buf.type_definition, opts_desc('Type Definition'))
          -- Organize imports: remove unused, then sort remaining
          vim.keymap.set('n', 'gO', function()
            vim.lsp.buf.code_action({
              context = { only = { 'source.removeUnusedImports' }, diagnostics = {} },
              apply = true,
            })
            vim.defer_fn(function()
              vim.lsp.buf.code_action({
                context = { only = { 'source.organizeImports' }, diagnostics = {} },
                apply = true,
              })
            end, 100)
          end, opts_desc('Organize imports'))

          -- Toggle inlay hints
          vim.keymap.set('n', '<leader>hh', function()
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end
          end, opts_desc('Toggle inlay [h]ints'))

          -- Toggle virtual text diagnostics only (underline stays off, signs stay on)
          vim.keymap.set('n', '<leader>xd', function()
            local cfg = vim.diagnostic.config
            local on = cfg().virtual_text ~= false
            if on then
              cfg { virtual_text = false }
            else
              cfg { virtual_text = { spacing = 4, source = 'if_many', prefix = '●' } }
            end
          end, opts_desc('Toggle virtual text'))

          -- Telescope bindings for LSP-related searches
          vim.keymap.set('n', '<space>fd', require('telescope.builtin').lsp_document_symbols, opts_desc('Document Symbols'))
          vim.keymap.set('n', '<space>fo', function() require('telescope.builtin').lsp_document_symbols({
            symbols = { 'method', 'function', 'class', 'struct', 'interface' },
            symbol_width = 60,
          }) end, opts_desc('Function Symbols'))
          vim.keymap.set('n', '<space>fw', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts_desc('Workspace Symbols'))

          -- Highlight references of the word under cursor when hovering
          if client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-document-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = bufnr,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = bufnr,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Mason setup for managing external language servers
      require('mason').setup({})

      require('mason-lspconfig').setup({
        ensure_installed = {
          'pyright',
          'bashls',
          'clangd',
          'cssls',
          'gopls',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
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

      -- JSON Schema support via schemastore for jsonls/yamlls
      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })
      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      })

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
