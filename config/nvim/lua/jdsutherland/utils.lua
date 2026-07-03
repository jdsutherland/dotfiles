local api = vim.api
local fn = vim.fn
local utils = {}

-- yanked from https://github.com/nicknisi/dotfiles/blob/main/config/nvim/lua/utils.lua
local function make_keymap_fn(mode, o)
  local parent_opts = vim.deepcopy(o)
  return function(combo, mapping, opts)
    assert(combo ~= mode, string.format("The combo should not be the same as the mode for %s", combo))
    local _opts = opts and vim.deepcopy(opts) or {}
    _opts = vim.tbl_extend("keep", _opts, parent_opts)
    vim.keymap.set(mode, combo, mapping, _opts)
  end
end

local map_opts = { noremap = false, silent = true }
utils.nmap = make_keymap_fn("n", map_opts)
utils.xmap = make_keymap_fn("x", map_opts)
utils.imap = make_keymap_fn("i", map_opts)
utils.vmap = make_keymap_fn("v", map_opts)
utils.omap = make_keymap_fn("o", map_opts)
utils.tmap = make_keymap_fn("t", map_opts)
utils.smap = make_keymap_fn("s", map_opts)
utils.cmap = make_keymap_fn("c", map_opts)

local noremap_opts = { noremap = true, silent = true }
utils.nnoremap = make_keymap_fn("n", noremap_opts)
utils.xnoremap = make_keymap_fn("x", noremap_opts)
utils.vnoremap = make_keymap_fn("v", noremap_opts)
utils.inoremap = make_keymap_fn("i", noremap_opts)
utils.onoremap = make_keymap_fn("o", noremap_opts)
utils.tnoremap = make_keymap_fn("t", noremap_opts)
utils.cnoremap = make_keymap_fn("c", noremap_opts)

function utils.has_map(map, mode)
  mode = mode or "n"
  return fn.maparg(map, mode) ~= ""
end

function utils.has_module(name)
  if pcall(function()
    require(name)
  end) then
    return true
  else
    return false
  end
end

function utils.termcodes(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function utils.file_exists(name)
  local f = io.open(name, "r")
  return f ~= nil and io.close(f)
end

function utils.has_active_lsp_client(servername)
  for _, client in pairs(vim.lsp.get_active_clients()) do
    if client.name == servername then
      return true
    end
  end
  return false
end

function utils.is_dark_mode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle == nil then
    return true
  end
  local result = handle:read("*a")
  handle:close()
  return result:match("^%s*Dark%s*$") ~= nil
end

-- Session management: automatically save and restore window/tab layout per directory/branch
vim.opt.sessionoptions = 'buffers,curdir,tabpages,winsize,winpos'

-- Function to get session file path based on cwd and git branch
local function get_session_file()
  local cwd = vim.fn.getcwd()
  -- Replace path separators with underscores to create a valid filename
  local cwd_encoded = cwd:gsub('/', '_'):gsub('\\', '_')

  -- Try to get git branch name
  local branch = vim.fn.system('git -C ' .. vim.fn.shellescape(cwd) .. ' rev-parse --abbrev-ref HEAD 2>/dev/null'):gsub('\n', '')

  -- If in a git repo and got a valid branch, include it in the filename
  local session_name = cwd_encoded
  if vim.v.shell_error == 0 and branch ~= '' then
    session_name = cwd_encoded .. '_' .. branch:gsub('/', '_')
  end

  -- Ensure sessions directory exists
  local sessions_dir = vim.fn.stdpath('data') .. '/sessions'
  vim.fn.mkdir(sessions_dir, 'p')

  return sessions_dir .. '/' .. session_name .. '.vim'
end

-- Save session on exit
vim.api.nvim_create_autocmd('VimLeavePre', {
  desc = 'Save session on exit',
  group = vim.api.nvim_create_augroup('auto-session', { clear = true }),
  callback = function()
    -- Only save if we're in a real directory (not empty buffer or special buffer)
    if vim.fn.argc() > 0 or vim.fn.bufname() ~= '' then
      local session_file = get_session_file()
      vim.cmd('mksession! ' .. vim.fn.fnameescape(session_file))
    end
  end,
})

-- Restore session on startup (only if no files were specified and not suppressed)
if vim.fn.argc() == 0 and not vim.g.no_session_restore then
  vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Restore session on startup',
    group = vim.api.nvim_create_augroup('auto-session-restore', { clear = true }),
    nested = true,
    callback = function()
      local session_file = get_session_file()
      if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. vim.fn.fnameescape(session_file))
      end
    end,
  })
end

return utils

