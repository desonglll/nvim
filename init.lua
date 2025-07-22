if vim.g.neovide then
    local default_path = vim.fn.expand("~")
    vim.api.nvim_set_current_dir(default_path)
    -- print(string.format("Neovide version: %s", vim.g.neovide_version))
    -- print("Neovide detected. Loading configuration for Neovide")
    vim.o.guifont = "ZedMono Nerd Font:h18"
    vim.opt.linespace = 2
    vim.g.neovide_text_gamma = 10
    vim.g.neovide_text_contrast = 5
end

require("config.lazy")
require("settings")
require("keymaps")

vim.cmd([[colorscheme tokyonight]])
