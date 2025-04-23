require "nvchad.options"
-- vim.api.nvim_create_augroup("CmpAutoGroup", { clear = true })
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = "CmpAutoGroup",
--   callback = function()
--     require("cmp").select_next_item()
--   end,
-- })

-- add yours here!

local o = vim.o
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
-- vim.o.winborder = "rounded"
o.scrolloff = 15
o.relativenumber = true
vim.wo.number = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
-- o.cursorlineopt ='both' -- to enable cursorline!
