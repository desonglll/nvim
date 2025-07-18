return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
    config = function()
        require("blink-cmp").setup({
            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = {
                documentation = { auto_show = true },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    }

                }
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
            keymap = {
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ['<M-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
                ["<C-e>"] = {
                    function(cmp)
                        cmp.cancel()
                    end
                },
                ["<CR>"] = {
                    "accept",
                    "fallback"
                },
                ['<Tab>'] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    'snippet_forward',
                    'fallback'
                },
                ['<S-Tab>'] = {
                    "snippet_backward",
                    "fallback"
                },
            },
        })
    end
}
