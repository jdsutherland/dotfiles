return {
  {
    "ThePrimeagen/harpoon",
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      require ("harpoon").setup {}

      vim.keymap.set('n', "<tab>mm", require("harpoon.mark").add_file, { desc = "Harpoon mark"})
      vim.keymap.set('n', "<tab>m", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon menu"})

      for i = 1, 5 do
        vim.keymap.set('n', string.format("<space>%s", i), function() require("harpoon.ui").nav_file(i) end, { desc = "Harpoon nav"})
      end
    end,
  },
}
