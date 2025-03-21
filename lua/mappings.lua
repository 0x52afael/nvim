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
map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>gq", ":q<CR>", { desc = "Close Git window" })
map("n", "<leader>gs", ":Git status<CR>", { desc = "Git status" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview hunk changes" })

map("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gP", ":Git push<CR>", { desc = "Git push" })
map("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
map("n", "<leader>gB", ":Git blame<CR>", { desc = "Git blame" })
map("n", "<leader>gal", ":Git add ", { desc = "Git add all modified files" })
map("n", "<leader>grs", ":Gread<CR>", { desc = "Reset file to last commit" })
map("n", "<leader>gw", ":Gwrite<CR>", { desc = "Stage current file" })
-- map("n", "<leader>gX", ":Gdelete<CR>", { desc = "Remove file from Git" })
map("n", "<leader>go", ":GBrowse<CR>", { desc = "Open in browser" })
map("n", "<leader>gH", ":Git log --oneline --graph --decorate<CR>", { desc = "Git log graph" })

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
