return {
    -- dir = vim.fn.expand("~/.config/nvim-local-plugins/nvim-lorem"),
    "desonglll/nvim-lorem",
    name = "lorem",
    cmd = { "Lorem" },
    config = function()
        require("lorem").setup()
    end,
}
