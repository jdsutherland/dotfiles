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

      vim.keymap.set('t', '<c-h>', [[<cmd>lua require("tmux").move_left()<cr>]])
      vim.keymap.set('t', '<c-j>', [[<cmd>lua require("tmux").move_down()<cr>]])
      vim.keymap.set('t', '<c-k>', [[<cmd>lua require("tmux").move_up()<cr>]])
      vim.keymap.set('t', '<c-l>', [[<cmd>lua require("tmux").move_right()<cr>]])
    end
  }
}
