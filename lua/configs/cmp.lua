local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp", priority = 1000 },
    { name = "buffer", priority = 250 },
    { name = "path", priority = 550 },
    { name = "tailwindcss-colorizer-cmp", priority = 400 }, -- Enables CSS class name completion
  },
}
