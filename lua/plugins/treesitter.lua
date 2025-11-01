return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
        ensure_installed = {
            "vim",
            "lua",
            "vimdoc",
            "kotlin",
            "python",
            "angular",
            "javascript",
            "typescript",
            "yaml",
            "json",
            "bash",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "tsx",
        },
        auto_install = true,
        textobjects = {
            select = {
                enable = false,
            },
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    config = function()
        vim.treesitter.language.register("tsx", "typescriptreact")
    end,
}
