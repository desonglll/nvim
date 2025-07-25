return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = function()
        vim.keymap.set("n", "<C-\\>", function()
            require("toggleterm").toggle()
        end)
    end,
}
