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

-- ============================================================================
-- Utility functions migrated from functions.vim
-- ============================================================================

--- Replace fancy typographic characters with plain equivalents
function utils.remove_fancy_characters()
  vim.cmd([[%s/\v(\u201c|\u201d)/"/ge]])
  vim.cmd([[%s/\v(\u2018|\u2019)/'/ge]])
  vim.cmd([[%s/\u2013/--/ge]])
  vim.cmd([[%s/\u2014/---/ge]])
  vim.cmd([[%s/\u2026/.../ge]])
  vim.cmd([[%s/\r/ /ge]])
end
vim.api.nvim_create_user_command("RemoveFancyCharacters", utils.remove_fancy_characters, {})

--- Rename current file
function utils.rename_file()
  local old_name = vim.fn.expand("%")
  local new_name = vim.fn.input("New file name: ", vim.fn.expand("%"), "file")
  if new_name ~= "" and new_name ~= old_name then
    vim.cmd("saveas " .. vim.fn.fnameescape(new_name))
    vim.cmd("silent !rm " .. vim.fn.fnameescape(old_name))
    vim.cmd("redraw")
  end
end

--- Send current file to language runner via vim-tmux-runner
function utils.send_file_via_vtr()
  local runners = {
    haskell = "ghci",
    ruby = "ruby",
    javascript = "node",
    python = "python",
    sh = "sh",
  }
  local runner = runners[vim.bo.filetype]
  if runner then
    vim.cmd("VtrSendCommandToRunner " .. runner .. " " .. vim.fn.expand("%"))
  else
    vim.notify("Unable to determine runner for " .. vim.bo.filetype, vim.log.levels.ERROR)
  end
end

--- Pretty-print current buffer as JSON
function utils.pretty_json()
  vim.cmd("%%!jq .")
  vim.bo.filetype = "json"
end
vim.api.nvim_create_user_command("PrettyJSON", utils.pretty_json, {})

-- Tmux git history helpers
function utils.tmux_git_individual_file_history()
  local filepath = vim.fn.shellescape(vim.fn.expand("%"))
  vim.fn.system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --patch --follow " .. filepath .. "; read'")
end
vim.api.nvim_create_user_command("TmuxGitIndividualFileHistory", utils.tmux_git_individual_file_history, {})

function utils.tmux_git_file_individual_history_reverse()
  local filepath = vim.fn.shellescape(vim.fn.expand("%"))
  vim.fn.system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --patch --reverse --follow " .. filepath .. "; read'")
end
vim.api.nvim_create_user_command("TmuxGitFileIndividualHistoryReverse", utils.tmux_git_file_individual_history_reverse, {})

function utils.tmux_git_file_full_history()
  local filepath = vim.fn.shellescape(vim.fn.expand("%"))
  vim.fn.system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --stat --patch --full-diff " .. filepath .. "; read'")
end
vim.api.nvim_create_user_command("TmuxGitFileFullHistory", utils.tmux_git_file_full_history, {})

function utils.tmux_git_file_full_history_reverse()
  local filepath = vim.fn.shellescape(vim.fn.expand("%"))
  vim.fn.system("tmux splitw -l 30% -h -c '#{pane_current_path}' 'git log --stat --patch --reverse --full-diff " .. filepath .. "; read'")
end
vim.api.nvim_create_user_command("TmuxGitFileFullHistoryReverse", utils.tmux_git_file_full_history_reverse, {})

--- Resize window to fit content, then fix height
function utils.resize_min()
  local line_count = vim.fn.line("$")
  local winheight = vim.fn.winheight(0)
  if line_count < winheight then
    vim.cmd("resize " .. line_count)
  end
  vim.opt_local.winfixheight = true
end
vim.api.nvim_create_user_command("ResizeMin", utils.resize_min, {})
vim.keymap.set("n", "<cr>m", ":ResizeMin<CR>", { silent = true })

--- System paste with trimmed newlines
function utils.sys_paste_trim_newlines()
  vim.cmd("normal \\<Plug>SystemPasteLine")
  vim.cmd("%%s/\\r/\\r/")
  vim.cmd("nohl")
end
vim.api.nvim_create_user_command("PPP", utils.sys_paste_trim_newlines, {})

return utils

