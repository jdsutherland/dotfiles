return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup{
        options = {
          theme = 'auto',
          section_separators = {''},
          component_separators = {''},
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
    end
  }
}
