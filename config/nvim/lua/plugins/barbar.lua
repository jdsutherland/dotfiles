return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
      require('barbar').setup({
        icons = { button = false },
        hide = { inactive = true }
      })
      vim.api.nvim_create_autocmd('BufEnter', { command = 'BufferOrderByWindowNumber' })
    end
  }
}
