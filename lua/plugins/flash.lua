return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
        { "gs",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "gS",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        {
            "gl",
            mode = { "n" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^"
                })
            end,

            desc = "Jump to a line"
        },
        {
            "gw",
            mode = { "n" },
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    -- select the range
                    jump = { pos = "range" },
                })
            end,
            desc = "Select any word"
        }

    },
}
