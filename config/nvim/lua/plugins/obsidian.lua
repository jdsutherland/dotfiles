-- Both machines keep the vault at the same path (it's a git checkout of
-- github.com/jdsutherland/personal), so no per-platform branching is needed.
-- obsidian.nvim raises "At least one workspace is required!" from
-- workspace.lua at setup when the path is missing, which surfaces as an error
-- on every nvim start, so skip the plugin entirely until the vault is cloned.
local vault = vim.fn.expand("~/vaults/personal")

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cond = vim.fn.isdirectory(vault) == 1,
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
        path = vault,
      },
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
