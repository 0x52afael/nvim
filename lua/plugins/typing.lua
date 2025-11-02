return {
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        dependencies = {
            "tpope/vim-repeat",
        },
        config = function()
            require("leap")
        end,
    },
    {

        "echasnovski/mini.nvim",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.surround").setup()
            require("mini.ai").setup()
            require("mini.pairs").setup()
            require("mini.operators").setup({
                exchange = {
                    prefix = "gX",

                    reindent_linewise = true,
                },
            })
            require("mini.bracketed").setup()
            require("mini.extra").setup()
            require("mini.clue").setup()
            require("mini.indentscope").setup()
        end,
    },
    {
        "sphamba/smear-cursor.nvim",
        lazy = false,
        opts = {
            hide_target_hack = true,
            cursor_color = "none",
        },
    },
}
-- vim: ts=2 sts=2 sw=2 et
