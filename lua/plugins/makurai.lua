return {
  "Skardyy/makurai-nvim",
  event = "VeryLazy",
  config = function()
    require "makurai".setup({
      transparent = false -- removes the bg color
    })

    -- vim.cmd.colorscheme("makurai_light")
    vim.cmd.colorscheme("catppuccin-macchiato")
    -- vim.cmd.colorscheme("catppuccin-frappe")
    -- vim.cmd.colorscheme("makurai_mage")
  end
}
