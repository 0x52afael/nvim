require "nvchad.mappings"

-- add yours here
vim.g.user_emmet_leader_key = ","
vim.g.user_emmet_mode = "a"
vim.o.relativenumber = true
vim.o.number = true
vim.o.smartcase = true
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fw", ":Telescope egrepify<CR>", { desc = "Find words (Egrepify)" })
map("n", "<leader>sk", ":Telescope keymaps<CR>", { desc = "Telescope find all keymaps" })
map("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Telescope list previous projects" })

map("n", "<leader>gq", ":q<CR>", { desc = "Close Git window" })
map("n", "<leader>gs", ":Neogit<CR>", { desc = "Open Neogit" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk changes" })

map("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gH", ":Git log --oneline --graph --decorate<CR>", { desc = "Git log graph" })
map("n", "<leader>on", ":lua require('mini.notify').show_history()<CR>", { desc = "Open Notification History" })
-- map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
}

map({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
map("n", "<M-j>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd "lnext"
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd "cnext"
  end
end, { noremap = true, silent = true })

map("n", "<M-k>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd "lprev"
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd "cprev"
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })
