return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",

  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.operators").setup()
    require("mini.files").setup()
    require("mini.bracketed").setup()
    require("mini.animate").setup({
      scroll = {
        enable = false,
      },
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    })
    require("mini.visits").setup()
    require("mini.extra").setup()
    require("mini.clue").setup()
    require("mini.indentscope").setup()
    require("mini.surround").setup()
  end,
}
