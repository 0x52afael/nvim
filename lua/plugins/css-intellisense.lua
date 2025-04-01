return {
  "Jezda1337/nvim-html-css",
  dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("html-css").setup {
      enable_on = {
        "html",
        "tsx",
        "angular",
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "jsx",
        "svelte",
        "vue",
        "astro",
      },
      documentation = {
        auto_show = true,
      },
      style_sheets = {
        "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
        "https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
        "./src/index.css",
      },
    }
  end,
}
