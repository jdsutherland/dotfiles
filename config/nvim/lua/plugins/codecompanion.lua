return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          show_settings = true,
        },
      },
      adapters = {
        http = {
          extend = {
            deepseek = {
              env = {
                api_key = os.getenv("DEEPSEEK_API_KEY"),
              },
              schema = {
                model = {
                  default = "deepseek-chat",
                },
                ["thinking.type"] = {
                  default = "disabled",
                },
                reasoning_effort = {
                  default = "high",
                },
              },
            },
          },
        },
      },
      rules = {
        default = {
          files = {},
        },
      },
      strategies = {
        chat = { adapter = "deepseek" },
        inline = { adapter = "deepseek" },
        agent = { adapter = "deepseek" },
      },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionChatCreated",
      callback = function(args)
        local bufnr = args.data.bufnr
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        if lines[1] ~= "---" then
          return
        end
        for i = 2, #lines do
          if lines[i] == "---" then
            local winnr = vim.fn.bufwinid(bufnr)
            if winnr ~= -1 then
              vim.api.nvim_win_call(winnr, function()
                vim.wo.foldenable = true
                vim.cmd(string.format("1,%dfold", i))
              end)
            end
            return
          end
        end
      end,
    })
  end,
}
