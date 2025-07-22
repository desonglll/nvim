if vim.g.neovide then
    local default_path = vim.fn.expand("~")
    vim.api.nvim_set_current_dir(default_path)
    -- print(string.format("Neovide version: %s", vim.g.neovide_version))
    -- print("Neovide detected. Loading configuration for Neovide")
    vim.o.guifont = "ZedMono Nerd Font:h18"
    vim.opt.linespace = 2
    vim.g.neovide_text_gamma = 10
    vim.g.neovide_text_contrast = 5

    vim.g.neovide_window_blurred = true
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_normal_opacity = 0.7

    -- vim.g.neovide_floating_shadow = true
    -- vim.g.neovide_floating_z_height = 10
    -- vim.g.neovide_light_angle_degrees = 45
    -- vim.g.neovide_light_radius = 5
    vim.g.neovide_scroll_animation_length = 0.3

    vim.g.neovide_hide_mouse_when_typing = false

    vim.g.neovide_confirm_quit = true

    vim.g.neovide_detach_on_quit = "always_detach"
    -- vim.g.neovide_fullscreen = true
    vim.g.neovide_macos_simple_fullscreen = true

    vim.g.neovide_cursor_hack = true
end

require("config.lazy")
require("settings")
require("keymaps")

vim.cmd([[colorscheme tokyonight]])
