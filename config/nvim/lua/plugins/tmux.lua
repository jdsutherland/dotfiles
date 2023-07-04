local utils = require("jdsutherland.utils")
local nnoremap = utils.nnoremap

return {
  {
    'aserowy/tmux.nvim',
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = true,
          persist_zoom = true,
        },
      })
      nnoremap("<left>", ":lua require('tmux').resize_left()<cr>")
      nnoremap("<down>", ":lua require('tmux').resize_bottom()<cr>")
      nnoremap("<up>", ":lua require('tmux').resize_top()<cr>")
      nnoremap("<right>", ":lua require('tmux').resize_right()<cr>")
    end
  }
}

