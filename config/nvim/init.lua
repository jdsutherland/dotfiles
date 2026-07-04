-- Ensure Neovim can find Lua modules in the dotfiles repo
vim.opt.rtp:prepend("/Users/j/.dotfiles/config/nvim")

require('jdsutherland.general')
require('jdsutherland.keymaps')
require('jdsutherland.autocmds')

-- Init lazy.nvim plugin manager.
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
