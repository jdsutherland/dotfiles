call plug#begin('~/.config/nvim/plugged')
let g:plug_pwindow = 'vnew'
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/keys.vim

map \V <Plug>(operator-vtr)
call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')

" {{{ lua config
lua << EOF
require('lualine').setup{
  options = {
    theme = 'base16_tomorrow_night',
    section_separators = {''},
    component_separators = {''},
    disabled_filetypes = {},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''}, {'diff'} },
    lualine_c = { {'filename', file_status = false, path = 1} },
    lualine_x = { 'filetype' },
    lualine_y = { 'ConflictedVersion', 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = { 'winnr' },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = { 'ConflictedVersion' },
    lualine_z = {  }
  },
  extensions = { 'fzf', 'fugitive' }
}

local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup{
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
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    project = {
      base_dirs = {
       --  TODO: add proper dirs
        {'~/Development/ruby', max_depth = 1},
      }
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('project')

require("todo-comments").setup {
  colors = {
    error   = { "#cc6666" },
    warning = { "#de934f" },
    info    = { "#8abeb7" },
    hint    = { "#81a2be" },
    default = { "#b294bb" },
    },
}

require("tmux").setup({
  navigation = {
    enable_default_keybindings = true,
    persist_zoom = true,
  },
})

require("zen-mode").setup({
  plugins = {
    tmux = { enabled = true },
  }
})

require("autosave").setup({
  enabled = true,
  execution_message = "",
  events = {"InsertLeave", "TextChanged", "FocusLost"},
  conditions = {
    exists = true,
    filetype_is_not = {"qf"},
    modifiable = true
  },
  write_all_buffers = true,
  on_off_commands = true,
})

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    -- TODO: decide to keep: loses perf of treesitter but allows conceal
    disable = { "css", "scss", "yaml", "eruby.yaml" },
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },

  -- TODO: use this once it works: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- textobjects = {
  --   lsp_interop = {
  --     enable = true,
  --     peek_definition_code = {
  --       ["df"] = "@function.outer",
  --       ["dF"] = "@class.outer",
  --     },
  --   },
  --   select = {
  --     enable = true,
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ac"] = "@class.outer",
  --       ["ic"] = "@class.inner",
  --     },
  --   },
  -- },
}
EOF
" }}}

hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#bababa
hi CocHintSign guifg=LightRed  guibg=NONE
hi CocMarkdownLink guifg=#b5bd68 guibg=NONE

hi TelescopeMatching  guifg=#81a2be

hi! Conceal guifg=LightRed
hi SpellRare cterm=undercurl guifg=Black guibg=LightRed
hi SpellBad cterm=undercurl guifg=Black guibg=#cc6666
