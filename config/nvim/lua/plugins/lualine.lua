return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()

      -- tweak kanagawa
      local custom_kanagawa = require'lualine.themes.kanagawa'
      local colors = require("kanagawa.colors").setup()
      custom_kanagawa.insert.a.bg = colors.theme.syn.string
      custom_kanagawa.insert.b.fg = colors.theme.syn.string

      require('lualine').setup{
        options = {
          theme = custom_kanagawa,
          component_separators = {''},
          section_separators = {''},
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''}, 'diff', 'diagnostics' },
          lualine_c = { {'filename' } },
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
        extensions = { 'fugitive', 'lazy' }
      }
    end
  }
}
