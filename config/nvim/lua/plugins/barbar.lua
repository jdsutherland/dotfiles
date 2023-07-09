return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
      require('barbar').setup({
        icons = { button = false },
        hide = { inactive = true }
      })

      local timer = vim.loop.new_timer()
      timer:start(0, 10000, function()
        vim.defer_fn(function()
          vim.cmd 'BufferOrderByWindowNumber'
        end, 0)

      end)
    end
  }
}
