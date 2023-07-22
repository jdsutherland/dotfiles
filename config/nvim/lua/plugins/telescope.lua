return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-node-modules.nvim",
      'jeetsukumaran/telescope-buffer-lines.nvim',
      'ThePrimeagen/harpoon',
      'benfowler/telescope-luasnip.nvim',
      -- TODO install 'nvim-telescope/telescope-frecency.nvim'
    },
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      function actions.yank_selection(prompt_bufnr)
        local selection = action_state.get_selected_entry(prompt_bufnr)
        local value = selection.value
        local prompt_title = action_state.get_current_picker(prompt_bufnr).prompt_title
        local content
        -- trim path:linenumber for grep type pickers
        if string.lower(prompt_title):match("grep") then
          content = value:match(":%d+:%d+:(.*)")
        else
          content = value
        end
        -- Put the content into the default yank register
        vim.fn.setreg('"', content)
        actions.close(prompt_bufnr)
      end

      require('telescope').setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            -- preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-s>"] = actions.select_horizontal,
              ["<C-t>"] = actions.select_tab,
              ["<C-y>"] = actions.preview_scrolling_up,
              ["<C-e>"] = actions.preview_scrolling_down,
              ["<c-o>"] = actions.yank_selection
            },
          },
        },
        pickers = { find_files = { find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" } } },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
          },
          file_ignore_patterns = { "node_modules" },
        },
      })

      local telescope = require('telescope')
      local utils = require("jdsutherland.utils")
      local nnoremap = utils.nnoremap
      local vnoremap = utils.vnoremap

      if vim.fn.executable "gh" == 1 then
        pcall(telescope.load_extension, "gh")
        nnoremap([[<localleader>fgi,]], [[<cmd>Telescope gh issues<cr>]])
        nnoremap([[<localleader>fgp,]], [[<cmd>Telescope gh pull_request<cr>]])
        nnoremap([[<localleader>fgg,]], [[<cmd>Telescope gh gist<cr>]])
      end

      nnoremap([[<space>ff]], [[<cmd>Telescope find_files<cr>]])
      nnoremap([[<space>fF]], [[<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--hidden', '--no-ignore', '--exclude', '.git', '--exclude', 'node_modules' }})<cr>]])
      nnoremap([[<space>fg]], [[<cmd>Telescope live_grep<cr>]])
      nnoremap([[<space>ft]], [[<cmd>Telescope buffers<cr>]])
      nnoremap([[<space>fh]], [[<cmd>Telescope help_tags<cr>]])
      nnoremap([[<space>f/]], [[<cmd>Telescope search_history<cr>]])
      nnoremap([[<space>f;]], [[<cmd>Telescope command_history<cr>]])
      nnoremap([[<space>fb]], [[<cmd>Telescope current_buffer_fuzzy_find<cr>]])
      nnoremap([[<space>fq]], [[<cmd>Telescope quickfix<cr>]])
      nnoremap([[K]], [[<cmd>Telescope grep_string<cr>]])
      vnoremap([[K]], [[<cmd>Telescope grep_string<cr>]])

      telescope.load_extension('fzf')
      telescope.load_extension('node_modules')
      telescope.load_extension('live_grep_args')
      vnoremap([[<space>fk]], [[<cmd>Telescope live_grep_args<cr>]])
      nnoremap([[<space>fk]], [[<cmd>Telescope live_grep_args<cr>]])

      telescope.load_extension('yank_history')
      nnoremap([[<space>fp]], [[<cmd>Telescope yank_history<cr>]])

      telescope.load_extension('buffer_lines')
      vim.cmd([[nnoremap <space>fl <cmd>Telescope buffer_lines<cr>]])

      require("telescope").load_extension('harpoon')
      nnoremap([[<space>fm]], [[<cmd>Telescope harpoon marks<cr>]])

      require('telescope').load_extension('luasnip')
      nnoremap([[<space>fs]], [[<cmd>Telescope luasnip<cr>]])
    end
  }
}
