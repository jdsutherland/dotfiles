-- The vault lives at a different path on each machine, so register whichever
-- one actually exists here. obsidian.nvim raises "At least one workspace is
-- required!" from workspace.lua at setup when every configured path is
-- missing, which surfaces as an error on every nvim start -- so skip loading
-- the plugin entirely when this machine has no vault yet.
local vault_candidates = {
  { name = "personal", path = vim.fn.expand("~/vaults/personal") },          -- macOS
  { name = "personal", path = vim.fn.expand("~/Documents/vault/personal") }, -- Omarchy
}

local workspaces = vim.tbl_filter(function(ws)
  return vim.fn.isdirectory(ws.path) == 1
end, vault_candidates)

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cond = #workspaces > 0,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = workspaces,
    picker = {
      name = "telescope.nvim",
    },
  },
}
