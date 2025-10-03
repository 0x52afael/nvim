return {
  "echasnovski/mini.notify",
  version = false,
  config = function()
    require("mini.notify").setup {
      lsp_progress = { enable = true },
      window = {
        winblend = 25,
        config = {
          border = 'double',
        }
      },
    }

  end,
}
