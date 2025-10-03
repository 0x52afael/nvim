return {
  "danymat/neogen",
  version = "*",
  config = function()
    require("neogen").setup { snippet_engine = "luasnip" }
  end,
}
