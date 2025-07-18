return {
    dir = vim.fn.expand("~/.config/nvim-local-plugins/nvim-dictionary"),
    -- "desonglll/nvim-dictionary",
    name = "dictionary",
    cmd = { "DownloadEnglishWords", "SyncEnglishWords", "DictionaryDir" },
    config = function()
        require("dictionary").setup({
            -- dir = vim.fn.expand(vim.fn.stdpath("config").."/dictionary")
        })
    end,
}
