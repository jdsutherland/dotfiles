return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      local garyGreen = '#dafeb4'
      require('kanagawa').setup({
        compilation = true,
        colors = {
          theme = {
            all = {
              ui = { bg_gutter = "none" },
            },
            dragon = {
              ui = {
                fg_dim = "#c5c9c5" -- dragonWhite
              }
            }
          },
        },
        dimInactive = true,
        theme = "dragon",
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- my tweaks
            Search = { fg = theme.ui.bg, bg = garyGreen },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopeResultsNormal = { fg = theme.ui.special, bg = theme.ui.bg },
            TelescopeMatching = { fg = garyGreen },

            -- https://github.com/rebelot/kanagawa.nvim#borderless-telescope
            -- TelescopeResultsBorder = { fg = theme.ui.bg, bg = theme.ui.bg },
            -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },

            -- https://github.com/rebelot/kanagawa.nvim#transparent-floating-windows
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            -- https://github.com/rebelot/kanagawa.nvim#dark-completion-popup-menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end
      })

      vim.cmd.colorscheme "kanagawa-dragon"
    end
  }
}
