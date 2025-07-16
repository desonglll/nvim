return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
        close_if_last_window = true,
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<cr>", { noremap = true, silent = true })
    end,
}
