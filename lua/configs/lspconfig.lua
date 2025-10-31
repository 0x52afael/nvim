require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'unocss',
    'html',
    'bashls',
    'cssls',
    'css_variables',
    'dockerls',
    'docker_compose_language_service',
    'cssmodules_ls',
    'jsonls',
    'tailwindcss',
    'lua_ls',
    'html-lsp',
    'emmet-language-server',
    'typescript-language-server',
  },
}

local servers = {
  'unocss',
  'html',
  'bashls',
  'cssls',
  'css_variables',
  'dockerls',
  'docker_compose_language_service',
  'cssmodules_ls',
  'jsonls',
  'tailwindcss',
  'lua_ls',
  'emmet_language_server',
  'ts_ls',
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
