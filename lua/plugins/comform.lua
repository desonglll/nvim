return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = {
                    "stylua",
                },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)
        end,
    },
    {

        "zapling/mason-conform.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },

        config = function(_, opts)
            require("mason-conform").setup(opts)
        end,

        dependencies = {
            "williamboman/mason.nvim",
            "stevearc/conform.nvim",
        },
    },
}
