return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim", -- Power telescope with FZF
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-node-modules.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    require('telescope').setup({
      defaults = {
        layout_setup = {
          horizontal = {
            width_padding = 0.04,
            height_padding = 0.1,
            preview_width = 0.6,
          },
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close, -- don't go into normal mode, just close
            ["<C-j>"] = actions.move_selection_next, -- scroll the list with <c-j>
            ["<C-k>"] = actions.move_selection_previous, -- scroll the list with <c-k>
            -- ["<C-\\->"] = actions.select_horizontal, -- open selection in new horizantal split
            -- ["<C-\\|>"] = actions.select_vertical, -- open selection in new vertical split
            ["<C-t>"] = actions.select_tab, -- open selection in new tab
            ["<C-y>"] = actions.preview_scrolling_up,
            ["<C-e>"] = actions.preview_scrolling_down,
          },
        },
      },
      pickers = { find_files = { find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" } } },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
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
      }
    })

    local telescope = require('telescope')

    if vim.fn.executable "gh" == 1 then
      pcall(telescope.load_extension, "gh")
    end

    local utils = require("jdsutherland.utils")
    local nnoremap = utils.nnoremap

    telescope.load_extension('fzf')
    telescope.load_extension('node_modules')
    telescope.load_extension('live_grep_args')
    -- TODO: map
    nnoremap([[<space>ff]], [[<cmd>Telescope find_files<cr>]])
    nnoremap([[<space>fG]], [[<cmd>Telescope live_grep_args<cr>]])
    nnoremap([[<space>fg]], [[<cmd>Telescope live_grep<cr>]])
    nnoremap([[<space>ft]], [[<cmd>Telescope buffers<cr>]])
    nnoremap([[<space>fh]], [[<cmd>Telescope help_tags<cr>]])
    nnoremap([[<space>fb]], [[<cmd>Telescope current_buffer_fuzzy_find<cr>]])
    nnoremap([[<space>fq]], [[<cmd>Telescope quickfix<cr>]])
    -- highlight cword, open exact uses
    -- nmap <silent><space>sd [I ;let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr> ;Telescope quickfix<cr>
    nnoremap([[<localleader>fgi,]], [[<cmd>Telescope gh issues<cr>]])
    nnoremap([[<localleader>fgp,]], [[<cmd>Telescope gh pull_request<cr>]])
    nnoremap([[<localleader>fgg,]], [[<cmd>Telescope gh gist<cr>]])
  end
}

