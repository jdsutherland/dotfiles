return {
  "chrishrb/gx.nvim",
  keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
  cmd = { "Browse" },
  config = function()
    require("gx").setup({
      select_prompt = false,
      handlers = {
        ruby_gem = {
          name = "ruby_gem",
          filetype = { "ruby" },
          filename = "Gemfile",
          handle = function(mode, line, _)
            local gem = require("gx.helper").find(line, mode, "['\"]%s*([^'\"]+)['\"]")
            if gem then
              return "https://rubygems.org/gems/" .. gem
            end
          end,
        },
        python_package = {
          name = "python_package",
          filetype = { "python" },
          handle = function(mode, line, _)
            -- Match import statements: import foo or from foo import
            local pkg = require("gx.helper").find(line, mode, "import%s+(%w+)")
            if pkg then
              return "https://pypi.org/project/" .. pkg
            end
            -- Match requirements.txt style: foo==1.0 or foo>=1.0
            pkg = require("gx.helper").find(line, mode, "^(%w[-%w.]+)%s*[~><=]")
            if pkg then
              return "https://pypi.org/project/" .. pkg
            end
          end,
        },
        python_pyproject = {
          name = "python_pyproject",
          filetype = { "toml" },
          filename = "pyproject.toml",
          handle = function(mode, line, _)
            -- Match key = "value" style: some-package = "1.0.0"
            local pkg = require("gx.helper").find(line, mode, "^(%w[-%w.]+)%s*=%s*['\"]")
            if pkg then
              return "https://pypi.org/project/" .. pkg
            end
            -- Match array style: "flask>=1.0" or "requests"
            pkg = require("gx.helper").find(line, mode, "['\"]%s*([^\"' ,\t>=<~!]+)")
            if pkg then
              return "https://pypi.org/project/" .. pkg
            end
          end,
        },
        rust_crate = {
          name = "rust_crate",
          filetype = { "toml" },
          filename = "Cargo.toml",
          handle = function(mode, line, _)
            local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")
            if crate then
              return "https://crates.io/crates/" .. crate
            end
          end,
        },
      },
    })
  end,
}
