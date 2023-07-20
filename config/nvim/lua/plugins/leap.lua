return {
  {
    'ggandor/leap.nvim', -- like easymotion
    config = function()
      require('leap').add_default_mappings(true)
    end
  },
  {
    'ggandor/flit.nvim',
    dependencies = 'ggandor/leap.nvim',
    opts = {},
  },
  {
    'ggandor/leap-spooky.nvim',
    dependencies = 'ggandor/leap.nvim',
    opts = {},
  },
}
