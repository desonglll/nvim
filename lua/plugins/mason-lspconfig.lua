return {
    {

        "mason-org/mason.nvim",
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {},
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {},
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                settings = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            })
        end,
    },
}
