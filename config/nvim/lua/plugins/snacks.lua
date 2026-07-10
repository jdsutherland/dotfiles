return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- picker/indent/explorer/zen/scope/terminal are deliberately left off
    -- since telescope/mini.indentscope/mini.files/zen-mode.nvim already
    -- cover those
    image = { enabled = true },
    quickfile = { enabled = true },
    notifier = { enabled = true },
    dashboard = { enabled = true },
    input = { enabled = true },
    bigfile = { enabled = true },
    scratch = { enabled = true },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    vim.api.nvim_create_user_command("Scratch", function()
      Snacks.scratch()
    end, { desc = "Toggle Scratch Buffer" })
    vim.api.nvim_create_user_command("ScratchSelect", function()
      Snacks.scratch.select()
    end, { desc = "Select Scratch Buffer" })
  end,
}
