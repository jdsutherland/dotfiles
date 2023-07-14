return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.align').setup { mappings = { start = '', start_with_preview = 'ga' } }
      require('mini.ai').setup {
        search_method = 'cover_or_nearest',
        mappings = { around_last = '', inside_last = '' }

      }
      require('mini.comment').setup { options = { ignore_blank_line = true } }
      require('mini.splitjoin').setup { mappings = { toggle = 'sj' } }
      require('mini.move').setup {}
      -- TODO: use this but grab the [e and [<space> from unimpaired
      -- require('mini.bracketed').setup {}
    end
  },
  {
    -- this is so similar to splitjoin that i'm throwing it in here
    "Wansmer/treesj",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { "sk", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    -- similar to mini.ai so putting here
    "chrisgrieser/nvim-various-textobjs",
    version = '',
    config = function()
      require('various-textobjs').setup({ useDefaultKeymaps = false })
      local keymap = vim.keymap.set

      -- 1st true means inner
      keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
      keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
      keymap({ "o", "x" }, "iI", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
      keymap({ "o", "x" }, "aI", "<cmd>lua require('various-textobjs').indentation(false, false)<CR>")

      keymap({ "o", "x" }, "id", "<cmd>lua require('various-textobjs').subword(false)<CR>")
      keymap({ "o", "x" }, "ad", "<cmd>lua require('various-textobjs').subword(true)<CR>")

      keymap({ "o", "x" }, "ae", "<cmd>lua require('various-textobjs').entireBuffer()<CR>")

      keymap({ "o", "x" }, "il", "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>")
      keymap({ "o", "x" }, "al", "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>")
      keymap({ "o", "x" }, "|", "<cmd>lua require('various-textobjs').column()<CR>")

      keymap({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').value(true)<CR>")
      keymap({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').value(false)<CR>")

      keymap({ "o", "x" }, "ik", "<cmd>lua require('various-textobjs').key(true)<CR>")
      keymap({ "o", "x" }, "ak", "<cmd>lua require('various-textobjs').key(false)<CR>")

      keymap({ "o", "x" }, "L", "<cmd>lua require('various-textobjs').url()<CR>")

      keymap({ "o", "x" }, "!", "<cmd>lua require('various-textobjs').diagnostic()<CR>")

      keymap({ "o", "x" }, "iz", "<cmd>lua require('various-textobjs').closedFold(true)<CR>")
      keymap({ "o", "x" }, "az", "<cmd>lua require('various-textobjs').closedFold(false)<CR>")

      keymap({ "o", "x" }, "im", "<cmd>lua require('various-textobjs').chainMember(true)<CR>")
      keymap({ "o", "x" }, "am", "<cmd>lua require('various-textobjs').chainMember(false)<CR>")

      --------------------------------------------------------------------------------------
      -- TODO put these into the ftplugins or autocms for the filetypes you want to use them with
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').mdlink(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').mdlink(false)<CR>",
      --   { buffer = true }
      -- )

      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').mdFencedCodeBlock(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').mdFencedCodeBlock(false)<CR>",
      --   { buffer = true }
      -- )

      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').cssSelector(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').cssSelector(false)<CR>",
      --   { buffer = true }
      -- )

      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').htmlAttribute(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').htmlAttribute(false)<CR>",
      --   { buffer = true }
      -- )

      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').doubleSquareBrackets(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').doubleSquareBrackets(false)<CR>",
      --   { buffer = true }
      -- )

      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').shellPipe(true)<CR>",
      --   { buffer = true }
      -- )
      -- keymap(
      --   { "o", "x" },
      --   "YOUR_MAPPING",
      --   "<cmd>lua require('various-textobjs').shellPipe(false)<CR>",
      --   { buffer = true }
      -- )
    end
  },
}
