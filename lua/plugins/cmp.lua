return {

  {
    "Jezda1337/nvim-html-css",
    dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("html-css").setup {
        enable_on = {
          "html",
          "tsx",
          "angular",
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "jsx",
          "svelte",
          "vue",
          "astro",
        },
        documentation = {
          auto_show = true,
        },
        style_sheets = {
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
          "https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
          "./src/index.css",
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path", -- source for file system paths
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local icons = require "configs.icons"
      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
      local source_mapping = {
        nvim_lsp = icons.LSP .. "[LSP]",
        nvim_lua = icons.Module .. "[Lua]",
        buffer = icons.File .. "[Buffer]",
        path = icons.Folder .. "[Path]",
        luasnip = icons.Snippet .. "[Snippet]",
      }

      -- Custom CSS source icons and mappings
      local css_icons = {
        bootstrap = " ", -- Bootstrap
        tailwind = "󱏿 ", -- Tailwind
        quasar = " ",
        file = " " or icons.File, -- Changed from 'local'
        remote = icons.Reference,
        inline = icons.Text,
      }
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-r>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm { select = false },
        },
        -- sources for autocompletion

        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "html-css", priority = 999 },
          { name = "nvim_lsp_signature_help", priority = 800 },
          { name = "luasnip", priority = 750 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250 },
        },
        formatting = {
          format = function(entry, vim_item)
            local source = entry.source.name
            local kind = vim_item.kind

            -- Handle HTML-CSS source specifically
            if source == "html-css" then
              local item_data = entry:get_completion_item().data
              local source_type = item_data and item_data.source_type or "file"
              local source_name = item_data and item_data.source_name or "unknown"

              -- Framework detection patterns (add more as needed)
              local framework_patterns = {
                { pattern = "bootstrap", icon = css_icons.bootstrap },
                { pattern = "tailwind", icon = css_icons.tailwind },
                { pattern = "bulma", icon = "󰡀 " },
                { pattern = "quasar", icon = css_icons.quasar },
                { pattern = "foundation", icon = "󰙅 " },
              }

              -- Check source name for framework matches first
              local lower_name = source_name:lower()
              local framework_icon
              for _, fp in ipairs(framework_patterns) do
                if lower_name:find(fp.pattern) then
                  framework_icon = fp.icon
                  break
                end
              end
              -- Use framework icon if found, otherwise use type-based icon
              local icon = framework_icon or css_icons[source_type] or css_icons.file
              -- Shorten path display for local files
              if source_type == "file" then
                source_name = vim.fn.fnamemodify(source_name, ":t")
              end

              source_mapping["html-css"] = icon .. " " .. source_name
            end
            local icon_kind = (kind .. " " .. icons[kind] or kind) .. " "
            vim_item.menu = source_mapping[entry.source.name] or "[Unknown]"
            -- Format kind indicator
            local strings = vim.split(icon_kind, "%s+", { trimempty = true })
            vim_item.kind = string.format("%-10s │", strings[1])

            return vim_item
          end,
        },
      }
    end,
  },
}
