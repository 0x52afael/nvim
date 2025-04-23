local util = require "lspconfig.util"

return {
  cmd = { "unocss-language-server", "--stdio" },
  filetypes = {
    "html",
    "scss",
    "css",
    "vue",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  init_options = {},

  -- determine project root by UnoCSS config, package.json or .git
  root_dir = function(fname)
    return util.root_pattern("unocss.config.ts", "uno.config.ts", "package.json", ".git")(fname)
  end,

  single_file_support = true,
  settings = {},
}
