-- n: normal mode
-- v: visual mode
-- x: visual block mode
local vim = vim

if vim.g.neovide then
    -- local default_path = vim.fn.expand("~")
    -- vim.api.nvim_set_current_dir(default_path)
    vim.api.nvim_set_current_dir(vim.env.PWD)
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

    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    vim.g.neovide_hide_mouse_when_typing = false

    vim.g.neovide_confirm_quit = true

    vim.g.neovide_detach_on_quit = "always_detach"
    vim.g.neovide_fullscreen = true
    -- vim.g.neovide_macos_simple_fullscreen = true

    vim.g.neovide_cursor_hack = true
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.swapfile = false
vim.g.mapleader = "\\"
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.o.timeout = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'v', 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n' }, '<leader>p', '"+p')
vim.keymap.set({ 'n' }, '<leader>P', '"+P')
vim.keymap.set({ 'v', 'n', 'x' }, '<leader>d', '"+d')

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Terminal mode: switch to normal window mode
vim.keymap.set("t", "<c-w>", [[<C-\><C-n><C-w>]])

-- Indent and keep selection in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":move '>+1<cr>gv-gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv-gv")

-- Save file in normal and visual mode
vim.keymap.set({ "n", "i" }, "<C-s>", ":w<CR>")
vim.keymap.set("v", "<C-s>", "<C-c>:w<CR>")

-- Plug installation using pack
vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://tpope.io/vim/repeat.git" },
    { src = "https://tpope.io/vim/speeddating.git" },
    { src = "https://github.com/glts/vim-magnum.git" },
    { src = "https://github.com/glts/vim-radical.git" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/petertriho/cmp-git" },
    { src = "https://github.com/nvim-lua/plenary.nvim" }
})

require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
    incremental_selection = {
        enable = true,
        keymaps = { node_incremental = "v", node_decremental = "V" }
    },
    ensure_installed = {},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true
})

require "nvim-autopairs".setup {}

vim.keymap.set('n', "gl", function()
    require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^"
    })
end)
vim.keymap.set('n', "gw", function()
    require("flash").jump({
        pattern = ".", -- initialize pattern with any char
        search = {
            mode = function(pattern)
                -- remove leading dot
                if pattern:sub(1, 1) == "." then
                    pattern = pattern:sub(2)
                end
                -- return word pattern and proper skip pattern
                return ([[\<%s\w*\>]]):format(pattern),
                    ([[\<%s]]):format(pattern)
            end
        },
        -- select the range
        jump = { pos = "range" }
    })
end)

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

-- LSP configurations

vim.lsp.enable({ "lua_ls", "rust_analyzer" })
vim.keymap.set('n', '<M-D-l>', vim.lsp.buf.format)

-- Colorschem configurations

vim.cmd("colorschem vague")
-- vim.cmd(":hi statusline guibg=NONE")

-- nvim-cmp configurations
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, { name = "luasnip" } -- For luasnip users.
    }, { { name = "buffer" } })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } })
})
require("cmp_git").setup()
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
