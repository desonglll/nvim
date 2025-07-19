return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    keys = {
        {
            "<c-w>w",
            function()
                local win_id = require("window-picker").pick_window()
                if win_id then
                    vim.api.nvim_set_current_win(win_id)
                end
            end,
            desc = "Pick Window",
        },
    },
    config = function()
        require("window-picker").setup()
    end,
}
