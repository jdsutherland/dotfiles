return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- picker/indent/explorer/zen/scope/terminal are deliberately left off
    -- since telescope/mini.indentscope/mini.files/zen-mode.nvim already
    -- cover those
    image = {
      enabled = true,
      -- fall back to Anki's media collection dir (cached by lua/plugins/anki.lua
      -- via AnkiConnect) for anki.nvim note buffers, whose <img src="..."> refs
      -- aren't resolvable relative to cwd/buffer-dir like normal files
      resolve = function(_, src)
        if vim.g.anki_media_dir and not src:match("^%w[%w+.-]*://") then
          local candidate = vim.g.anki_media_dir .. "/" .. src
          if vim.fn.filereadable(candidate) == 1 then
            return candidate
          end
        end
        return nil
      end,
    },
    quickfile = { enabled = true },
    notifier = { enabled = true },
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
