--- @type NvPluginSpec

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "go",
      "python",
      "angular",
      "typescript",
      "javascript",
      "html",
      "css",
    },
  },
}
