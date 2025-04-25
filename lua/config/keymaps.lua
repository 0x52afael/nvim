-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
})

map({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
map("n", "<M-j>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd("lnext")
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd("cnext")
  end
end, { noremap = true, silent = true })

map("n", "<M-k>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd("lprev")
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd("cprev")
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map({ "n", "x" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<s-Tab>", ":bprevious<CR>", { desc = "Prev Tab" })
map({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy" })

map("n", "<C-n>", function()
  require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
end, { desc = "Open NerdTree" })

map("n", "<leader>x", ":bdelete<cr>", { desc = "Close Tab" })
