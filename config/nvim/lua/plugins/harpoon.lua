return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      -- Load and set up harpoon
      local harpoon = require("harpoon")
      harpoon:setup({})

      -- Keymaps for basic Harpoon functionality
      vim.keymap.set('n', "<tab>mm", function() harpoon:list():add() end, { desc = "Harpoon add file" })
      vim.keymap.set('n', "<tab>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })

      for i = 1, 5 do
        vim.keymap.set('n', string.format("<space>%s", i), function() harpoon:list():select(i) end, { desc = "Harpoon navigate" })
      end

      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })

      -- Telescope integration for Harpoon
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<space>fm", function() toggle_telescope(harpoon:list()) end, { desc = "Open Harpoon in Telescope" })
    end,
  },
}
