return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      return { timeout_ms = 1000, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black', stop_after_first = true },
      ruby = { 'rubocop', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      jsonc = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      sh = { 'shfmt' },
      go = { 'gofmt' },
      rust = { 'rustfmt', stop_after_first = true },
      zig = { 'zigfmt', stop_after_first = true },
      elixir = { 'mix', stop_after_first = true },
      clojure = { 'cljfmt', stop_after_first = true },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      swift = { 'swiftformat', stop_after_first = true },
      haskell = { 'fourmolu', 'ormolu', stop_after_first = true },
      nix = { 'nixfmt', stop_after_first = true },
      terraform = { 'terraformfmt', stop_after_first = true },
    },
  },
}
