return {
  {
    "LazyVim/LazyVim",
    init = function()
      vim.g.lazyvim_disable_keymaps = true
    end,
    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = false, -- lazyvim.config.keymaps
        options = true, -- lazyvim.config.options
      },
    },
  },
}
