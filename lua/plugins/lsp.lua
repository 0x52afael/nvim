return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "nvim-lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lspconfig = require "mason-lspconfig"
      mason_lspconfig.setup {
        ensure_installed = {
          "html",
          "biome",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "cssmodules_ls",
          "css_variables",
        },
        automatic_installation = true,
      }
    end,
  },
}
