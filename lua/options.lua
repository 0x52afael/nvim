require "nvchad.options"

vim.cmd [[highlight HlSearchLensNear guifg=#00ff00 gui=bold ctermfg=green]]
vim.cmd [[highlight HlSearchLens guifg=#ffffff ctermbg=2]]
local o = vim.o
o.winborder = "rounded"
o.scrolloff = 15
o.relativenumber = true
vim.wo.number = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.swapfile = false
o.backup = false
o.writebackup = false

