-- nvim-treesitter main branch: the old module system (highlight/indent/etc.
-- opts) is gone. Highlighting and indent are started per-buffer via the
-- FileType autocmd below; companion plugins attach themselves.
local ensure_installed = {
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
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
      "JoosepAlviste/nvim-ts-context-commentstring",
      'RRethy/nvim-treesitter-endwise',
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
    config = function()
      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("jdsutherland_treesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang or not pcall(vim.treesitter.start, args.buf, lang) then
            return
          end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- incremental selection via builtin |v_an|/|v_in| (nvim 0.12+)
      vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Increment selection" })
      vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Increment selection" })
      vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Decrement selection" })

      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true, -- automatically jump forward to matching textobj
        },
        move = {
          set_jumps = true,
        },
      }

      local ts_select = require("nvim-treesitter-textobjects.select")
      for lhs, query in pairs({
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
      }) do
        vim.keymap.set({ "x", "o" }, lhs, function()
          ts_select.select_textobject(query, "textobjects")
        end)
      end

      local ts_move = require("nvim-treesitter-textobjects.move")
      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        ts_move.goto_next_start("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        ts_move.goto_previous_start("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "n", "x", "o" }, "]C", function()
        ts_move.goto_next("@conditional.outer", "textobjects")
      end)
      vim.keymap.set({ "n", "x", "o" }, "[C", function()
        ts_move.goto_previous("@conditional.outer", "textobjects")
      end)

      local ts_swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "><leader>", function()
        ts_swap.swap_next("@parameter.inner")
      end)
      vim.keymap.set("n", "<<leader>", function()
        ts_swap.swap_previous("@parameter.inner")
      end)

      require'treesitter-context'.setup()
      require('ts_context_commentstring').setup{}
    end
  },
}
