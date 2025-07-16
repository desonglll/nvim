return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        incremental_selection = {
            enable = true,
            keymaps = {
                node_incremental = "v",
                node_decremental = "V",
            },
        },
        ensure_installed = {},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
