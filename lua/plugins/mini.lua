return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",

  config = function()
    require("mini.surround").setup()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.operators").setup()
    require("mini.files").setup()
    require("mini.bracketed").setup()
    require("mini.animate").setup()
    require("mini.git").setup()
    require("mini.visits").setup()
    require("mini.extra").setup()
    require("mini.clue").setup()
    require("mini.indentscope").setup()
  end,
}
