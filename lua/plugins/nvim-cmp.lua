return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "neovim/nvim-lspconfig",
            "petertriho/cmp-git",
            "L3MON4D3/LuaSnip"
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup(
                {
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    window = {
                        -- completion = cmp.config.window.bordered(),
                        -- documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-d>"] = cmp.mapping.scroll_docs(4),
                        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                        ['<C-g>'] = function()
                            if cmp.visible_docs() then
                                cmp.close_docs()
                            else
                                cmp.open_docs()
                            end
                        end,
                        -- ["<M-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),

                        ['<C-l>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                return cmp.complete_common_string()
                            end
                            fallback()
                        end, { 'i', 'c' }),
                        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ['<Tab>'] = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            else
                                fallback()
                            end
                        end,
                        ['<S-Tab>'] = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            else
                                fallback()
                            end
                        end
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" }, -- For luasnip users.
                    }, {
                        { name = "buffer" },
                    }),
                }
            )

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" },
                }, {
                    { name = "buffer" },
                }),
            })
            require("cmp_git").setup()
            --

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            })

            -- Set up lspconfig.
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            --   capabilities = capabilities
            -- }
        end,
    }
}
