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
      require('mini.splitjoin').setup { mappings = { toggle = '<tab>j' } }
      require('mini.sessions').setup {}

      require('mini.files').setup {
        windows = {
          preview = true,
          width_preview = 80,
        }
      }
      -- -- Map '-' to open mini.files
      -- vim.keymap.set('n', '-', function()
      --   require('mini.files').open()
      -- end, { desc = 'Open mini.files' })

      vim.keymap.set('n', '<space>-', function()
        local current_file = vim.api.nvim_buf_get_name(0) -- Get the current buffer's file path
        local current_dir = vim.fn.fnamemodify(current_file, ':h') -- Get the directory of the file

        -- Toggle mini.files using the recommended approach
        if not require('mini.files').close() then
          require('mini.files').open(current_dir)
        end
      end, { desc = 'Toggle mini.files in current buffer folder' })

      -- TODO: use this but grab the [e and [<space> from unimpaired
      -- require('mini.bracketed').setup {}
      vim.cmd[[highlight MiniIndentscopeSymbol guifg=#35393F]]
    end
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
          "ruby",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      local iscope = require('mini.indentscope')
      iscope.setup({
        symbol = "│",
        options = { try_as_border = true },
        draw = { animation = iscope.gen_animation.none() },
      })
    end
  },

  {
    -- this is so similar to splitjoin that i'm throwing it in here
    "Wansmer/treesj",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { "<tab>k", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    -- TODO: see if this gets used
    'David-Kunz/treesitter-unit',
    config = function()
      vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
      vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', {noremap=true})
      vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})
      vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', {noremap=true})
    end
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
