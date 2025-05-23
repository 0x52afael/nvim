---@type NvPluginSpec
return {
  "jay-babu/mason-null-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    ensure_installed = {
      "angular-language-server",
      "bash-language-server",
      "biome",
      "css-lsp",
      "dockerfile-language-server",
      "emmet-ls",
      "eslint-lsp",
      "helm-ls",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "nxls",
      "prettierd",
      "stylua",
      "swiftlint",
      "typescript-language-server",
      "typos-lsp",
      "vtsls",
      "yaml-language-server",
    },
  },
}
