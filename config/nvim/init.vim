" call plug#begin('~/.config/nvim/plugged')
" let g:plug_pwindow = 'vnew'
" source ~/.dotfiles/config/nvim/plugins.vim
" call plug#end()

source ~/.dotfiles/config/nvim/functions.vim
source ~/.dotfiles/config/nvim/autocmds.vim

" Use kana/vim-operator-user for textobj with vtr
" https://github.com/christoomey/vim-tmux-runner/pull/86#issuecomment-608474159

" TODO: move this
" map \V <Plug>(operator-vtr)
" call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')

" {{{ lua config
lua << EOF
require('jdsutherland.general')
require('jdsutherland.keymaps')

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
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  change_detection = { enabled = false }
})

EOF
" }}}
