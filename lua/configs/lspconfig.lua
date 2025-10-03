local lspconfig = require "lspconfig"
local util = require("lspconfig.util")

require("nvchad.configs.lspconfig").defaults()
require("mason-tool-installer").setup {
  ensure_installed = {
    "lua-language-server",
    "unocss",
    "html",
    "bashls",
    "cssls",
    "css_variables",
    "dockerls",
    "docker_compose_language_service",
    "cssmodules_ls",
    "jsonls",
    "tailwindcss",
    "lua_ls",
    "vscode-langservers-extracted",
    "emmet-language-server",
    "typescript-language-server",
  },
}

local servers = {
  "unocss",
  "html",
  "bashls",
  "cssls",
  "css_variables",
  "dockerls",
  "docker_compose_language_service",
  "cssmodules_ls",
  "jsonls",
  "tailwindcss",
  "lua_ls",
  "emmet-language-server",
  "ts_ls",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

lspconfig.ts_ls.setup {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },

  -- Safe for Neovim 0.12
  root_dir = util.root_pattern("package.json", "package-lock.json", "tsconfig.json"),
}

do
  local default_handler = vim.lsp.handlers.signature_help
  vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
    config = config or {}
    config.focusable = false
    config.border = "rounded"
    default_handler(err, result, ctx, config)
  end
end
