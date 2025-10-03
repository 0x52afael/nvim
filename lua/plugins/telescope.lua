return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-project.nvim",
      "nvim-lua/plenary.nvim",
      "fdschmidt93/telescope-egrepify.nvim",
    },
    config = function()
      require("telescope").setup {
        extensions = {
          projects = {},
          -- ui_select = {
          --   -- your ui_select settings here
          -- },
        },
      }
      require("telescope").load_extension "projects"
      require("telescope").load_extension "egrepify"
    end,
  },
}
