return {
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact" }, -- Added missing filetypes
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true, -- Example setting for Emmet
      },
    },
  },
  single_file_support = true,
}
