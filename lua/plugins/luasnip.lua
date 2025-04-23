return {
  {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      require("luasnip").config.set_config(opts)

      local luasnip = require "luasnip"

      luasnip.filetype_extend("javascriptreact", { "html" })
      luasnip.filetype_extend("typescriptreact", { "html" })
      luasnip.filetype_extend("svelte", { "html" })

      require "nvchad.configs.luasnip"
    end,
  },
}
