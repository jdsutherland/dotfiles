return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      'RRethy/nvim-treesitter-endwise',
      -- textsubjects removed: depends on removed define_modules API
      'nvim-treesitter/nvim-treesitter-context',
      'phelipetls/jsonpath.nvim',
      {
        "andymass/vim-matchup",
        event = "BufReadPost",
        init = function()
          vim.o.matchpairs = "(:),{:},[:],<:>"
        end,
        config = function()
          vim.g.matchup_matchparen_deferred = 1
          vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
        end,
      },
    },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "css",
        "diff",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
      -- playground removed: deprecated, use :InspectTree, :EditQuery, :Inspect instead

      -- RRethy/nvim-treesitter-endwise,
      endwise = {
        enable = true,
      },

      -- andymass/vim-matchup
      matchup = {
        enable = true,
      },

      -- RRethy/nvim-treesitter-textsubjects
      textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
          -- textobj <cr>
          ['<cr>'] = 'textsubjects-smart',
          -- TODO find where these are useful
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner',
        },
      },

      -- nvim-treesitter/nvim-treesitter-textobjects
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            [']m'] = '@function.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
          },
          goto_next = {
            ["]C"] = "@conditional.outer",
          },
          goto_previous = {
            ["[C"] = "@conditional.outer",
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ["><leader>"] = "@parameter.inner",
          },
          swap_previous = {
            ["<<leader>"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          lookahead = true, -- automatically jump forward to matching textobj
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
      require'treesitter-context'.setup()
      require('ts_context_commentstring').setup{}
    end
  },
}
