return {
  -- test new blink
  { import = "nvchad.blink.lazyspec" },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
      local blink = require "blink"
      blink.load_snippets_from_vscode {
        filetype_extend = {
          typescript = { "javascript", "typescript", "jsdoc", "tsdoc" },
          typescriptreact = { "javascriptreact" },
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require "configs.conform"
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    version = "*",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
      },

      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            return cmp.select_next()
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            return cmp.select_prev()
          end,
          "snippet_backward",
          "fallback",
        },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "fallback" },

        ["<C-up>"] = { "scroll_documentation_up", "fallback" },
        ["<C-down>"] = { "scroll_documentation_down", "fallback" },
      },

      -- Experimental signature help support
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            min_keyword_length = 1, -- Number of characters to trigger porvider
            score_offset = 100, -- Boost/penalize the score of the items
          },
          path = {
            min_keyword_length = 2,
            score_offset = 50,
          },
          snippets = {
            preset = "luasnip",
            min_keyword_length = 0,
            score_offset = 70,
          },
          buffer = {
            min_keyword_length = 5,
            min_keyword_length = 1,
            max_items = 10,
          },
        },

        completion = {
          accept = { auto_brackets = { enabled = true } },

          documentation = {
            auto_show = true,
            auto_show_delay_ms = 250,
            treesitter_highlighting = true,
            window = { border = "rounded" },
          },

          menu = {
            border = "rounded",
            draw = {
              components = {
                -- customize the drawing of kind icons
                kind_icon = {
                  text = function(ctx)
                    -- default kind icon
                    local icon = ctx.kind_icon
                    -- if LSP source, check for color derived from documentation
                    if ctx.item.source_name == "LSP" then
                      local color_item =
                        require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                      if color_item and color_item.abbr ~= "" then
                        icon = color_item.abbr
                      end
                    end
                    return icon .. ctx.icon_gap
                  end,
                  highlight = function(ctx)
                    -- default highlight group
                    local highlight = "BlinkCmpKind" .. ctx.kind
                    -- if LSP source, check for color derived from documentation
                    if ctx.item.source_name == "LSP" then
                      local color_item =
                        require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                      if color_item and color_item.abbr_hl_group then
                        highlight = color_item.abbr_hl_group
                      end
                    end
                    return highlight
                  end,
                },
              },
            },
            cmdline_position = function()
              if vim.g.ui_cmdline_pos ~= nil then
                local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                return { pos[1] - 1, pos[2] }
              end
              local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
              return { vim.o.lines - height, 0 }
            end,
          },
        },
      },
    },
  },
}
