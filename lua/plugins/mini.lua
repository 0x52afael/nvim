return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",

  config = function()
    require("mini.surround").setup()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.operators").setup {
      exchange = {
        prefix = "gX",

        reindent_linewise = true,
      },
    }
    require("mini.files").setup()
    require("mini.bracketed").setup()
    require("mini.animate").setup()
    require("mini.git").setup()
    require("mini.visits").setup()
    require("mini.extra").setup()
    require("mini.clue").setup()
    require("mini.indentscope").setup()
    -- require("mini.hues").setup { background = "#002734", foreground = "#c0c8cc", saturation = "high" }
    -- require("mini.base16").setup {
    --   palette = {
    --     base00 = "#112641",
    --     base01 = "#3a475e",
    --     base02 = "#606b81",
    --     base03 = "#8691a7",
    --     base04 = "#d5dc81",
    --     base05 = "#e2e98f",
    --     base06 = "#eff69c",
    --     base07 = "#fcffaa",
    --     base08 = "#ffcfa0",
    --     base09 = "#cc7e46",
    --     base0A = "#46a436",
    --     base0B = "#9ff895",
    --     base0C = "#ca6ecf",
    --     base0D = "#42f7ff",
    --     base0E = "#ffc4ff",
    --     base0F = "#00a5c5",
    --   },
    --   use_cterm = true,
    --   plugins = {
    --     default = false,
    --     ["echasnovski/mini.nvim"] = true,
    --   },
    -- }
    -- local filterout_lua_diagnosing = function(notif_arr)
    --   local not_diagnosing = function(notif)
    --     return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
    --   end
    --   notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
    --   return MiniNotify.default_sort(notif_arr)
    -- end
  end,
}
