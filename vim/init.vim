call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/keys.vim

" {{{ lua config
lua << EOF
require('lualine').setup{
  options = {
    theme = 'base16_tomorrow_night',
    section_separators = {'', ''},
    component_separators = {'', '|'},
    disabled_filetypes = {},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = false} },
    lualine_x = { 'filetype' },
    lualine_y = { 'ConflictedVersion', 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = { 'ConflictedVersion' },
    lualine_z = {  }
  },
  extensions = { 'fzf', 'fugitive' }
}

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    layout_defaults = {
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
  }
}

require("todo-comments").setup {
  colors = {
    error = { "#cc6666" },
    warning = { "#de934f" },
    info = { "#8abeb7" },
    hint = { "#81a2be"},
    default = { "#b294bb" },
    },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    -- TODO: decide to keep: loses perf of treesitter but allows conceal
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF
" }}}

hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#bababa
hi CocHintSign guifg=LightRed  guibg=NONE
hi CocMarkdownLink guifg=#b5bd68 guibg=NONE

highlight TelescopeMatching       guifg=#81a2be

hi! Conceal guifg=LightRed
hi SpellRare cterm=undercurl guifg=Black guibg=LightRed
hi SpellBad cterm=undercurl guifg=Black guibg=#cc6666
