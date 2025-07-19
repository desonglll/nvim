return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        priority = 1000,
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "famiu/bufdelete.nvim",
        },

        opts = {
            pick = {
                alphabet = "abcdefghijklmopqrstuvwxyz",
            },
        },
        keys = {
            { "<Tab>", mode = { "n" }, "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
            { "<S-Tab>", mode = { "n" }, "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
        },
        config = function(_, opts)
            vim.opt.termguicolors = true
            require("bufferline").setup({})
            vim.keymap.set(
                "n",
                "gD",
                "<cmd>BufferLinePickClose<CR>",
                { desc = "Pick Delete buffer" }
            )
            vim.keymap.set(
                "n",
                "<leader>gO",
                "<cmd>BufferLineCloseOthers<CR>",
                { desc = "Delete other buffers" }
            )
            vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
            -- vim.keymap.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
        end,
    },
}
