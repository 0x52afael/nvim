vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-float",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "TelescopeFindPre",
--   callback = function()
--     vim.opt_local.winborder = "none"
--     vim.api.nvim_create_autocmd("WinLeave", {
--       once = true,
--       callback = function()
--         vim.opt_local.winborder = "rounded"
--       end,
--     })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    vim.keymap.set({ "n", "v" }, "<CR>", function()
      require("kulala").run()
    end, { desc = "Send request (Kulala)", buffer = true })
  end,
})
