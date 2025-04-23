--- @type NvPluginSpec
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-project.nvim" }, -- Ensure project extension is installed
    config = function()
      require("telescope").setup {
        extensions = {
          projects = {},
        },
      }
      require("telescope").load_extension "projects"
      require("telescope").load_extension "egrepify"
      require("telescope").load_extension "ui-select"
    end,
  },
}
