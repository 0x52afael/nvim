-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local configs = require "nvchad.configs.lspconfig"

local nv_on_attach = configs.on_attach
local nv_on_init = configs.on_init
local capabilities = require("cmp_nvim_lsp").default_capabilities()

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

local servers = { "css-lsp", "biome", "tailwindcss", "cssmodules_ls", "css_variables" }
local nvlsp = require "nvchad.configs.lspconfig"

local function on_attach(client, bufnr)
  nv_on_attach(client, bufnr)
end

local function on_init(client, bufnr)
  nv_on_init(client, bufnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
    filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  }
end

lspconfig.html.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = configs.capabilities,
  filetypes = { "html", "templ", "javascriptreact", "typescriptreact" },
  settings = {
    html = {
      suggest = {
        className = true, -- Enables class name autocompletion
      },
    },
  },
}

lspconfig.emmet_ls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "html", "less", "sass", "scss", "scss", "pug", "javascriptreact", "typescriptreact" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}

lspconfig.eslint.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    local root = lspconfig.util.root_pattern(
      ".eslintrc.js",
      ".eslintrc.json",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      ".eslintrc.jsonc"
    )(fname)
    if root then
      return util.root_pattern(".git", ".jj")(fname)
    end

    return nil
  end,
}

lspconfig.vtsls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git", ".jj"),
  filetypes = { "angular", "typescript", "typescriptreact", "javascript", "javascriptreact" },
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      preferences = {
        quoteStyle = "auto",
      },
    },
  },
}
