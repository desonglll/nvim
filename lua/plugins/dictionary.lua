return {
    "desonglll/nvim-dictionary",
    name = "dictionary",
    cmd = { "DownloadEnglishWords", "SyncEnglishWords" },
    config = function()
        require("dictionary")
    end,
}
