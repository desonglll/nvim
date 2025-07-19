return {
    "folke/drop.nvim",
    opts = {
        theme = "auto",
        screensaver = 1000 * 60 * 5,
    },
    config = function(_, opts)
        require("drop").setup(opts)
    end,
}
