return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "rcasia/neotest-java",
  },
  config = function()
    require("neotest").setup {
      discovery = {
        enabled = false,
      },
      adapters = {
        require "neotest-java",
        require "neotest-python" {
          dap = { justMyCode = false },
          runner = "pytest",
          pytest_discover_instances = true,
          is_test_file = function(file_path)
            return vim.startswith(file_path, "test_") or file_path:match "tests?/.*%.py$"
          end,
        },
        require "neotest-runner" {
          command = function(path)
            return "npm test --browsers=ChromeHeadless --watch=false --include" .. path
          end,
        },
      },
    }
  end,
}
