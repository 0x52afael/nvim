-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local M = {}
local ascii = require "ascii"
M.base46 = {
  theme = "catppuccin",
  transparency = false,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  cmp = {
    style = "flat_dark",
  },
  statusline = {
    enabled = true,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = ascii.get_random_global(),
}

return M
