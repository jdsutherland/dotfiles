return {
  {
    'gbprod/yanky.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    config = function()
      local mapping = require("yanky.telescope.mapping")
      local utils = require("yanky.utils")
      require('yanky').setup({
        system_clipboard = {
          sync_with_ring = false,
        },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = {
              default = mapping.set_register(utils.get_default_register()),
            }
          },
        },
      })
      vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfterFilter)")
      vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBeforeFilter)")
      vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
      vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")
    end
  },
}
