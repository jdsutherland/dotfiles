
return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  dependencies = {
    'zapling/mason-conform.nvim',
  },
  keys = {
    {
      -- TODO: map necessary?
      '<leader>ff',
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
      -- Only auto-format if the project has a formatter config file
      local has_config = function(files)
        local dir = vim.fn.getcwd()
        for _, f in ipairs(files) do
          -- Walk up directory tree from cwd to root
          local test_dir = dir
          while test_dir ~= '' do
            if vim.fn.filereadable(test_dir .. '/' .. f) == 1 then
              return true
            end
            local parent = vim.fn.fnamemodify(test_dir, ':h')
            if parent == test_dir then
              break
            end
            test_dir = parent
          end
        end
        return false
      end

      local ft = vim.bo[bufnr].filetype
      if ft == 'python' and not has_config({ 'pyproject.toml', 'setup.cfg' }) then
        return
      end
      if ft == 'ruby' and not has_config({ '.rubocop.yml' }) then
        return
      end
      if ft == 'lua' and not has_config({ 'stylua.toml' }) then
        return
      end
      if ft == 'c' or ft == 'cpp' or ft == 'cuda' then
        if not has_config({ '.clang-format' }) then
          return
        end
      end
      if ft == 'rust' and not has_config({ 'rustfmt.toml' }) then
        return
      end
      if ft == 'zig' and not has_config({ 'zigfmt.toml' }) then
        return
      end
      if ft == 'elixir' and not has_config({ 'mix.exs' }) then
        return
      end
      if ft == 'clojure' and not has_config({ '.cljfmt.clj', 'cljfmt.edn' }) then
        return
      end
      if ft == 'swift' and not has_config({ '.swiftformat' }) then
        return
      end
      if ft == 'haskell' and not has_config({ 'fourmolu.yaml', 'ormolu.yaml' }) then
        return
      end
      -- prettier: .prettierrc, .prettierrc.yml, .prettierrc.toml, .prettierrc.json
      if vim.startswith(ft, 'javascript') or vim.startswith(ft, 'typescript') or ft == 'json' or ft == 'yaml' or ft == 'html' or ft == 'css' or ft == 'markdown' then
        if not has_config({ '.prettierrc', '.prettierrc.yml', '.prettierrc.toml', '.prettierrc.json', 'prettier.config.js' }) then
          return
        end
      end

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
