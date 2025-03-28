return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascriptreact", "typescriptreact" }, -- Enable for specific filetypes
  init = function()
    vim.g.user_emmet_leader_key = ","
  end,
}
