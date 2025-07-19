return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "Kaiser-Yang/blink-cmp-dictionary",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },

    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
    config = function()
        require("blink-cmp").setup({
            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = { auto_show = true },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
            },

            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer", "dictionary" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                    dictionary = {
                        module = "blink-cmp-dictionary",
                        name = "Dict",
                        -- Make sure this is at least 2.
                        -- 3 is recommended
                        min_keyword_length = 3,
                        opts = {
                            -- options for blink-cmp-dictionary
                            dictionary_directories = function()
                                return {
                                    vim.fn.expand(
                                        vim.fs.joinpath(vim.fn.stdpath("cache"), "dictionary")
                                    ),
                                }
                            end,
                        },
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
            keymap = {
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<M-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = { "select_next", "fallback_to_mappings" },
                ["<C-e>"] = {
                    function(cmp)
                        cmp.cancel()
                    end,
                },
                ["<CR>"] = {
                    "accept",
                    "fallback",
                },
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ["<S-Tab>"] = {
                    "snippet_backward",
                    "fallback",
                },
            },
        })
    end,
}
