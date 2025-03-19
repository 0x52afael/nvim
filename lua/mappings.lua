require "nvchad.mappings"

-- add yours here

vim.o.relativenumber = true
vim.o.number = true
vim.o.smartcase = true
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sk", ":Telescope keymaps<CR>", { desc = "Telescope find all keymaps" })
map("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Telescope list previous projects" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
