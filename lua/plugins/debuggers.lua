return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    })

    vim.api.nvim_set_hl(0, "OrangeCursor", {
      fg = "#FFA500",
      bg = "NONE",
    })

    vim.fn.sign_define("DapStopped", {
      text = "→",
      texthl = "OrangeCursor",
      linehl = "",
      numhl = "",
    })
    -- Set a custom highlight group for the breakpoint (green color)
    vim.api.nvim_set_hl(0, "DapBreakpoint", {
      fg = "#ff0000", -- Green color for the bug icon
      bg = "NONE", -- No background
      bold = true, -- Make it bold
    })

    local dap_python = require "dap-python"
    dap_python.setup "python"
    dap_python.test_runner = "pytest"

    dapui.setup {
      windows = {
        indent = 1,
      },
      layout = {
        elements = {
          { id = "stacks", size = 0 }, -- Set to zero size to hide the stacks window
          { id = "scopes", size = 0.25 },
          { id = "breakpoints", size = 0.1 },
          { id = "watches", size = 0.25 },
        },
      },
    }
    require("nvim-dap-virtual-text").setup {
      commented = true,
    }

    -- auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- setup python
  end,
}
