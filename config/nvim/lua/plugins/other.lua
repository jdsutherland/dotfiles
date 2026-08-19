-- Jump between a file and its counterpart (implementation <-> test, .c <-> .h).
--
-- Chosen over tpope/vim-projectionist, which vim-rails would otherwise pull in
-- for :A. Note :A does NOT currently exist -- vim-rails needs projectionist for
-- it and projectionist isn't installed -- so there's nothing to collide with
-- here. vim-rails is still worth keeping for everything else it does.
return {
  "rgroli/other.nvim",
  -- Module is "other-nvim", not the "other" that lazy would infer from the
  -- repo name, so opts would never reach setup() without this.
  main = "other-nvim",
  cmd = { "Other", "OtherSplit", "OtherVSplit", "OtherTabNew", "OtherClear" },
  keys = {
    { "<leader>oo", "<cmd>Other<cr>",      desc = "Other: alternate file" },
    { "<leader>ov", "<cmd>OtherVSplit<cr>", desc = "Other: alternate (vsplit)" },
    { "<leader>os", "<cmd>OtherSplit<cr>",  desc = "Other: alternate (split)" },
    { "<leader>ot", "<cmd>OtherTabNew<cr>", desc = "Other: alternate (tab)" },
  },
  opts = {
    -- Builtins matching the languages in config/nvim/snippets. Deliberately
    -- omits angular/laravel/livewire/elixir/clojure -- every extra mapping is
    -- another candidate in the picker.
    --   c       .c <-> .h, .cpp <-> .hpp
    --   golang  foo.go <-> foo_test.go
    --   python  foo.py <-> test_foo.py
    --   react   .ts/.tsx/.js/.jsx <-> .test.*  (covers plain TS/JS, not just JSX)
    --   rust    src/foo.rs <-> tests/test_foo.rs
    --   rails   model/controller <-> spec or minitest
    mappings = {
      "c",
      "golang",
      "python",
      "react",
      "rust",
      "rails",
    },

    -- Defaults worth keeping, noted so they aren't a mystery later:
    --   showMissingFiles = true  -- picker lists counterparts that don't exist
    --                               yet; selecting one creates it. This is the
    --                               main thing projectionist can't do.
    --   rememberBuffers  = true  -- remembers a picked pairing for the session
    --                               (:OtherClear forgets it).

    style = {
      -- Everything else here uses rounded borders (see vim.o.winborder in
      -- plugins/lsp.lua); the plugin defaults to "solid".
      border = "rounded",
    },
  },
}
