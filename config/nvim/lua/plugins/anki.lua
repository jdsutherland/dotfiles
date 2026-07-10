return {
  "jdsutherland/anki.nvim", -- fork of 0fflineuser/anki.nvim with macOS clipboard-paste and buffer-listing fixes
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim", -- optional: image preview in the media browser
  },
  cmd = "Anki",
  opts = {
    -- requires the AnkiConnect addon (code 2055492159) installed in Anki,
    -- with Anki running, before `:Anki` can actually connect
    default_mappings = false, -- default <leader>a collides with <leader>aa/<leader>aj (Sideways)
  },
  config = function(_, opts)
    require("anki").setup(opts)

    -- snacks.image only registers its FileType autocmd (which triggers
    -- inline rendering) lazily on BufReadPre - but anki.nvim's buffers are
    -- all created via nvim_create_buf(), which never fires BufReadPre. If
    -- no real file had been opened yet this session, rendering would never
    -- attach at all. Force it explicitly; it's idempotent (a did_setup
    -- guard), so calling it here is always safe.
    require("snacks.image").setup()

    -- anki.nvim's note editor buffers are filetype=html with <img src="...">
    -- tags pointing at filenames inside Anki's media collection, but
    -- snacks.image's default resolver only checks cwd/buffer-dir/img_dirs -
    -- none of which is Anki's media folder. Cache the real path (via
    -- AnkiConnect, since it's not a fixed location) for lua/plugins/snacks.lua
    -- to use as a resolve() fallback.
    require("anki.ankiconnect").get_media_dir_path(function(result)
      if result then
        vim.g.anki_media_dir = result
      end
    end)
  end,
}
