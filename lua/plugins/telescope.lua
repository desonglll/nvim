return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>sg", function()
            builtin.live_grep({
                grep_open_files = true
            })
        end, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Definition" })
    end,
}
