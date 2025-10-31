return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      'vim',
      'lua',
      'vimdoc',
      'kotlin',
      'python',
      'angular',
      'javascript',
      'typescript',
      'yaml',
      'json',
      'bash',
      'html',
      'css',
      'markdown',
      'markdown_inline',
    },
    auto_install = true,
    textobjects = {
      select = {
        enable = false,
      },
    },
    highlight = {
      enable = true,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
