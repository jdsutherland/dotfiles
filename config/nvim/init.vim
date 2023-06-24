call plug#begin('~/.config/nvim/plugged')
let g:plug_pwindow = 'vnew'
source ~/.dotfiles/config/nvim/plugins.vim
call plug#end()

source ~/.dotfiles/config/nvim/general.vim
source ~/.dotfiles/config/nvim/functions.vim
source ~/.dotfiles/config/nvim/autocmds.vim
source ~/.dotfiles/config/nvim/keys.vim

" Use kana/vim-operator-user for textobj with vtr
" https://github.com/christoomey/vim-tmux-runner/pull/86#issuecomment-608474159
map \V <Plug>(operator-vtr)
call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')

" {{{ lua config
lua << EOF
require('lualine').setup{
  options = {
    theme = 'auto',
    section_separators = {''},
    component_separators = {''},
    disabled_filetypes = {},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''}, {'diff'} },
    lualine_c = { {'filename', file_status = false, path = 1} },
    lualine_x = { 'filetype' },
    lualine_y = { 'ConflictedVersion', 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = { 'winnr' },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = { 'ConflictedVersion' },
    lualine_z = {  }
  },
  extensions = { 'fzf', 'fugitive' }
}

local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup{
  defaults = {
    layout_setup = {
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    project = {
      base_dirs = {
       --  TODO: add proper dirs
        {'~/Development/ruby', max_depth = 1},
      }
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('gh')

require("todo-comments").setup {
  colors = {
    error   = { "#cc6666" },
    warning = { "#de934f" },
    info    = { "#8abeb7" },
    hint    = { "#81a2be" },
    default = { "#b294bb" },
    },
}

require("tmux").setup({
  navigation = {
    enable_default_keybindings = true,
    persist_zoom = true,
  },
})

require("zen-mode").setup({
  plugins = {
    tmux = { enabled = true },
  }
})

-- {{{ Autosave.nvim
require("autosave").setup({
  enabled = false,
  -- execution_message = "",
  events = {"InsertLeave", "TextChanged"},
  conditions = {
    exists = true,
    -- filetype_is_not = {"qf"},
    modifiable = true
  },
  write_all_buffers = true,
  on_off_commands = true,
})
-- }}}

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { "css", "scss", "yaml", "eruby.yaml", "json" },
    -- NOTE: loses perf of treesitter but allows conceal
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },

  -- TODO: use this once it works: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- textobjects = {
  --   lsp_interop = {
  --     enable = true,
  --     peek_definition_code = {
  --       ["df"] = "@function.outer",
  --       ["dF"] = "@class.outer",
  --     },
  --   },
  --   select = {
  --     enable = true,
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ac"] = "@class.outer",
  --       ["ic"] = "@class.inner",
  --     },
  --   },
  -- },
}

require 'colorizer'.setup()

-- {{{ octo
require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- Bubble delimiter
  left_bubble_delimiter = "";             -- Bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel
  },
  mappings = {
    issue = {
      close_issue = "<space>ic",           -- close issue
      reopen_issue = "<space>io",          -- reopen issue
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload issue
      open_in_browser = "<C-b>",           -- open issue in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    pull_request = {
      checkout_pr = "<space>po",           -- checkout PR
      merge_pr = "<space>pm",              -- merge PR
      list_commits = "<space>pc",          -- list PR commits
      list_changed_files = "<space>pf",    -- list PR changed files
      show_pr_diff = "<space>pd",          -- show PR diff
      add_reviewer = "<space>va",          -- add reviewer
      remove_reviewer = "<space>vd",       -- remove reviewer request
      close_issue = "<space>ic",           -- close PR
      reopen_issue = "<space>io",          -- reopen PR
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload PR
      open_in_browser = "<C-b>",           -- open PR in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    review_thread = {
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      add_suggestion = "<space>sa",        -- add suggestion
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    submit_win = {
      approve_review = "<C-a>",            -- approve review
      comment_review = "<C-m>",            -- comment review
      request_changes = "<C-r>",           -- request changes review
      close_review_tab = "<C-c>",          -- close review tab
    },
    review_diff = {
      add_review_comment = "<space>ca",    -- add a new review comment
      add_review_suggestion = "<space>sa", -- add a new review suggestion
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      next_thread = "]t",                  -- move to next thread
      prev_thread = "[t",                  -- move to previous thread
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    },
    file_panel = {
      next_entry = "j",                    -- move to next changed file
      prev_entry = "k",                    -- move to previous changed file
      select_entry = "<cr>",               -- show selected changed file diffs
      refresh_files = "R",                 -- refresh changed files panel
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    }
  }
})
-- }}}

EOF
" }}}

" {{{ colors
hi CocErrorSign  ctermfg=Red guifg=#cc6666
hi CocWarningSign  ctermfg=Brown guifg=#f0c674
hi CocInfoSign  ctermfg=Yellow guifg=#bababa
hi CocHintSign guifg=LightRed  guibg=NONE
hi CocMarkdownLink guifg=#b5bd68 guibg=NONE
" hi CocFloating guibg='#282a2c'
" hi CocFloating guibg='#161820'

hi TelescopeMatching  guifg=#81a2be

hi! Conceal guifg=LightRed
hi SpellRare cterm=undercurl guifg=Black guibg=LightRed
hi SpellBad cterm=undercurl guifg=Black guibg=#cc6666
" }}}
