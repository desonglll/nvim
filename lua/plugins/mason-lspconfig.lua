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
            automatic_enable = false,
            ensure_installed = {},
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {},
        keys = {
            {
                "grh",
                mode = { "n" },
                function()
                    vim.lsp.inlay_hint.enable()
                end,
                desc = "toggle lsp inlay hint",
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            -- vim.lsp.config()
            local masonlsp = require("mason-lspconfig").get_installed_servers()

            -- Go here for more detail field: vim.lsp.ClientConfig
            for _, server in ipairs(masonlsp) do
                lspconfig[server].setup({
                    capabilities = {
                        vim.lsp.protocol.make_client_capabilities(),
                    },
                    on_attach = function(client, bufnr)
                        if client.server_capabilities.inlayHintProvider then
                            print(string.format("bufnt: %s", bufnr))
                        end
                    end,
                    settings = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                })
            end

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
