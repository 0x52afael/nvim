---type @ChadrcConfig
local M = {}

local fortune = require "fortune"

M.base46 = {
  theme = "github_light",
}

M.lspconfig = {
  v = {
    ["<leader>ca"] = { require("actions-preview").code_actions, "Preview Code Actions" },
  },
  n = {
    ["<leader>ca"] = { require("actions-preview").code_actions, "Preview Code Actions" },
  },
}


M.ui = {
  lsp = {
    signature = { enabled = false },
  },
  cmp = {
    style = "flat_light", -- atom old
  },
}

M.nvdash = {
  load_on_startup = true,
  header = fortune.get_fortune(48),
  buttons = {
    { txt = " ", hl = "NvDashHidden", no_gap = true, rep = true },
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Find Project", keys = "Spc f p", cmd = "Telescope projects" },
    { txt = "󰈚  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "  Themes", keys = "Spc t h", cmd = "Telescope themes" },
    { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
    },
  },
}

return M
