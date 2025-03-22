local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "tailwindcss-colorizer-cmp" }, -- Enables CSS class name completion
  },
}
