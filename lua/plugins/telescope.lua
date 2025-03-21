--- @type NvPluginSpec
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
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
    end,
  },
}
