return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function()
    local leap = require "leap"
    leap.add_default_mappings()
    -- leap.opts.case_sensitive = true
  end,
  dependencies = {
    "tpope/vim-repeat",
    lazy = false,
  },
}
