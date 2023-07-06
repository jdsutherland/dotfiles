return {
  {
    'ethanholz/nvim-lastplace', config = function() require'nvim-lastplace'.setup() end
  },
  {
    'NvChad/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end
  },
  'jghauser/mkdir.nvim',
  -- =========== vimscript plugins ===========
  'troydm/zoomwintab.vim',
  'jdsutherland/vim-github-link-opener',
  'christoomey/vim-system-copy',
  'vim-scripts/ReplaceWithRegister',
  'vim-scripts/ReplaceWithSameIndentRegister',
  'tpope/vim-apathy',
  'tpope/vim-dispatch',
  'tpope/vim-dotenv',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-scriptease',
  'tpope/vim-sleuth',
  -- 'wellle/targets.vim',
  'tpope/vim-unimpaired',
  'tpope/vim-vinegar',
  'tpope/vim-ragtag',
  {
    'tpope/vim-dadbod',
    dependencies = { 'kristijanhusak/vim-dadbod-ui' }
  },
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
      'rbong/vim-flog',
    }
  },
}
