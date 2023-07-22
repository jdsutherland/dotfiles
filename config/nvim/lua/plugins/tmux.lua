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
        copy_sync = { sync_clipboard = false },
      })

      local opts = {expr = true, noremap = true, silent = true}
      -- resize floating windows, otherwise tmux resize
      -- TODO: keep this?
      vim.keymap.set(
        'n',
        '<left>',
        [[v:lua.vim.api.nvim_win_get_config(0).relative != "" ? "<c-w><" : ":lua require('tmux').resize_left()<cr>"]],
        opts
      )

      vim.keymap.set(
        'n',
        '<right>',
        [[v:lua.vim.api.nvim_win_get_config(0).relative != "" ? "<c-w>>" : ":lua require('tmux').resize_right()<cr>"]],
        opts
      )

      vim.keymap.set(
        'n',
        '<down>',
        [[v:lua.vim.api.nvim_win_get_config(0).relative != "" ? "<c-w>+" : ":lua require('tmux').resize_bottom()<cr>"]],
        opts
      )

      vim.keymap.set(
        'n',
        '<up>',
        [[v:lua.vim.api.nvim_win_get_config(0).relative != "" ? "<c-w>-" : ":lua require('tmux').resize_top()<cr>"]],
        opts
      )
    end
  }
}
