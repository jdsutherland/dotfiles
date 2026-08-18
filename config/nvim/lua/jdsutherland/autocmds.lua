-- Autocommands migrated from autocmds.vim

local augroup = vim.api.nvim_create_augroup

-- Autosave on focus lost
local save_focused_lost_group = augroup("SaveFocusedLost", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", {
  group = save_focused_lost_group,
  command = "silent! wall",
})

-- Open binary/image/doc files in system default app
local binary_nonvim_open_group = augroup("binary_nonvim_open", { clear = true })
vim.api.nvim_create_autocmd("BufReadCmd", {
  group = binary_nonvim_open_group,
  pattern = {
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.svg",
    "*.doc",
    "*.docx",
    "*.xls",
    "*.xlsx",
    "*.ppt",
    "*.pptx",
  },
  callback = function()
    local opener = vim.fn.has("mac") == 1 and "open" or "xdg-open"
    vim.cmd("silent execute '!" .. opener .. " " .. vim.fn.shellescape(vim.fn.expand("<afile>")) .. " &>/dev/null'")
    local tobedeleted = vim.fn.bufnr("%")
    vim.cmd("b#")
    vim.cmd("bd! " .. tobedeleted)
  end,
})

-- Read PDFs through pdftotext
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*.pdf",
  command = "silent set ro",
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  command = "silent %!pdftotext -nopgbrk -layout -q -eol unix '%' - | fmt -w78",
})

-- Read EPUB/mobi/rtf/odp/odt through pandoc
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.epub", "*.mobi", "*.rtf", "*.odp", "*.odt" },
  command = "silent %!pandoc '%' -tplain -o /dev/stdout",
})

-- Quickfix window: wrap and auto-height
local quickfix_group = augroup("quickfix", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = quickfix_group,
  pattern = "qf",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    -- Auto-fit height
    local maxheight = 10
    local minheight = 3
    local height = math.min(math.max(vim.fn.line("$"), minheight), maxheight)
    vim.cmd(height .. "wincmd _")
  end,
})

-- Git commit: spellcheck + kspell completion
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.complete:append({ "kspell" })
  end,
})

-- Elixir: ,tt maps to |
vim.api.nvim_create_autocmd("FileType", {
  pattern = "elixir",
  callback = function()
    vim.keymap.set("i", ",tt", "\\|>", { buffer = true })
  end,
})

-- Swap ; and : in code filetypes for easier typing
local code_filetypes = { "go", "python", "ruby", "eruby", "eruby.yaml", "elixir",
  "haskell", "typescript", "typescriptreact", "yaml", "docker-compose", "json" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = table.concat(code_filetypes, ","),
  callback = function()
    vim.keymap.set("i", ";", ":", { buffer = true })
    vim.keymap.set("i", ":", ";", { buffer = true })
    vim.keymap.set("n", "r;", "r:", { buffer = true })
    vim.keymap.set("n", "r:", "r;", { buffer = true })
    vim.keymap.set("n", "t;", "t:", { buffer = true })
    vim.keymap.set("n", "f;", "f:", { buffer = true })
    vim.keymap.set("n", "T;", "T:", { buffer = true })
    vim.keymap.set("n", "F;", "F:", { buffer = true })
  end,
})

-- Resize when tmux pane changes
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- Ruby gem info lookup on Gemfile
vim.api.nvim_create_user_command("ShowGemInfo", function()
  local gem
  if vim.fn.expand("%:t") == "Gemfile.lock" then
    gem = vim.fn.expand("<cword>")
  else
    local line = vim.fn.getline(".")
    gem = line:match("['\"]%s*([^'\"]+)['\"]")
  end
  if not gem or gem == "" then return end
  local url = "https://rubygems.org/api/v1/gems/" .. gem .. ".json"
  local response = vim.fn.system("curl -s " .. vim.fn.shellescape(url))
  local ok, decoded = pcall(vim.json.decode, response)
  if ok and decoded.info then
    local info = decoded.info:gsub("%s+", " "):sub(1, 200)
    vim.notify(info)
  end
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "Gemfile*",
  callback = function()
    vim.keymap.set("n", "<space><space>", ":ShowGemInfo<CR>", { buffer = true, silent = true })
  end,
})

-- npm package info lookup on package.json/yarn.lock
vim.api.nvim_create_user_command("ShowPackageInfo", function()
  local package
  local ft = vim.fn.expand("%:t")
  if ft == "package-lock.json" or ft == "yarn.lock" then
    package = vim.fn.expand("<cword>")
  else
    local line = vim.fn.getline(".")
    package = line:match("['\"]%s*([^'\"]+)['\"]")
  end
  if not package or package == "" then return end
  local info = vim.fn.system("npm info " .. vim.fn.shellescape(package) .. " 2>/dev/null | sed -n 3p")
  vim.cmd("redraw")
  info = info:gsub("%s+", " "):sub(1, 200)
  if info ~= "" then vim.notify(info) end
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "package.json", "package-lock.json", "yarn.lock", "pnpm-lock.yaml" },
  callback = function()
    vim.keymap.set("n", "<space><space>", ":ShowPackageInfo<CR>", { buffer = true, silent = true })
  end,
})
