return {
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'tpope/vim-repeat',
    },
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {

    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup()
      require('mini.ai').setup()
      require('mini.pairs').setup()
      require('mini.operators').setup {
        exchange = {
          prefix = 'gX',

          reindent_linewise = true,
        },
      }
      require('mini.files').setup()
      require('mini.bracketed').setup()
      require('mini.animate').setup()
      require('mini.git').setup()
      require('mini.visits').setup()
      require('mini.extra').setup()
      require('mini.clue').setup()
      require('mini.indentscope').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
