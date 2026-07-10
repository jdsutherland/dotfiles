return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
