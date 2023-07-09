return {
  {
    "ThePrimeagen/harpoon",
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      require ("harpoon").setup {}

      vim.keymap.set('n', "<space>ma", require("harpoon.mark").add_file)
      vim.keymap.set('n', "<space>mm", require("harpoon.ui").toggle_quick_menu)

      for i = 1, 5 do
        vim.keymap.set('n', string.format("<space>%s", i), function() require("harpoon.ui").nav_file(i) end)
      end
    end,
  },
}
