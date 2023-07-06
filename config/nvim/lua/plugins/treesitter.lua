return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      -- show treesitter nodes
      "nvim-treesitter/playground", -- enable more advanced treesitter-aware text objects
      "nvim-treesitter/nvim-treesitter-textobjects", -- add rainbow highlighting to parens and brackets
      "JoosepAlviste/nvim-ts-context-commentstring",
      'RRethy/nvim-treesitter-endwise',
      'RRethy/nvim-treesitter-textsubjects',
    },
    config = function()
      require("nvim-treesitter.configs").setup({
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
          "json",
          "json5",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "ruby",
          "rust",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        highlight = { enable = true, use_languagetree = true },
        indent = { enable = true },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,
          persist_queries = false,
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },

        -- JoosepAlviste/nvim-ts-context-commentstring
        context_commentstring = { enable = true },

        -- RRethy/nvim-treesitter-endwise,
        endwise = {
          enable = true,
        },

        -- RRethy/nvim-treesitter-textsubjects
        textsubjects = {
          enable = true,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['.'] = 'textsubjects-smart',
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
      })
    end
  },
}
