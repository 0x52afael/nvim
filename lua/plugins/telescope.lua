return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    { "<leader>r", false },
    { "<leader>fr", false },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent" },
    { "<leader><leader>", false },
    -- change a keymap
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    { "<leader>fp", false },
    { "<leader>fp", ":Telescope projects<CR>", desc = "Telescope list previous projects" },
    { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>ds", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    {
      "<leader>sy",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = LazyVim.config.get_kind_filter(),
        })
      end,
      desc = "Goto Symbol LSP",
    },
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
}
