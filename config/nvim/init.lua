require('jdsutherland.general')
require('jdsutherland.keymaps')
require('jdsutherland.autocmds')

-- This is a standalone lazy.nvim config, not a LazyVim distribution. Omarchy's
-- generated theme.lua still contributes a LazyVim option spec so its theme
-- hot-reloader can discover the active colorscheme. Since our own plugin specs
-- intentionally load alongside it rather than after LazyVim's core/extras
-- imports, the distribution's import-order warning does not apply here.
vim.g.lazyvim_check_order = false

-- Init lazy.nvim plugin manager.
-- Plugins are automatically sourced in config/nvim/lua/plugins/*
-- Plugins with little to no configuration live in config/nvim/lua/plugins/init.lua
-- otherwise, each plugin has an associated file in config/nvim/lua/plugins
-- see https://github.com/folke/lazy.nvim/blob/main/README.md#-structuring-your-plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  change_detection = { enabled = false },
})
