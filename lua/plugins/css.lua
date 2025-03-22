return {
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind.nvim",
  {
    "js-everts/cmp-tailwind-colors",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("cmp-tailwind-colors").setup()
    end,
  },
}
