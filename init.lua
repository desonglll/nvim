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
vim.opt.swapfile = false
vim.g.mapleader = "\\"
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.o.timeout = false

vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'v', 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n' }, '<leader>p', '"+p')
vim.keymap.set({ 'n' }, '<leader>P', '"+P')
vim.keymap.set({ 'v', 'n', 'x' }, '<leader>d', '"+d')

-- Exit insert mode
vim.keymap.set(
	"i",
	"jk",
	"<ESC>",
	{ noremap = true, silent = true, desc = "Exit insert mode (jk)" }
)

-- Terminal mode: switch to normal window mode
vim.keymap.set(
	"t",
	"<c-w>",
	[[<C-\><C-n><C-w>]],
	{ noremap = true, silent = true, desc = "Terminal window switch" }
)

-- Indent and keep selection in visual mode
vim.keymap.set(
	"v",
	"<",
	"<gv",
	{ noremap = true, silent = true, desc = "Indent left (keep visual)" }
)
vim.keymap.set(
	"v",
	">",
	">gv",
	{ noremap = true, silent = true, desc = "Indent right (keep visual)" }
)

-- Move lines in visual mode
vim.keymap.set(
	"v",
	"J",
	":move '>+1<cr>gv-gv",
	{ noremap = true, silent = true, desc = "Move line(s) down" }
)
vim.keymap.set(
	"v",
	"K",
	":move '<-2<cr>gv-gv",
	{ noremap = true, silent = true, desc = "Move line(s) up" }
)

-- Save file in normal and visual mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set(
	"v",
	"<C-s>",
	"<C-c>:w<CR>",
	{ noremap = true, silent = true, desc = "Save file (visual)" }
)


vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }
})

require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	auto_install = true,
	highlight = {
		enable = true
	}
})

vim.keymap.set('n',
	"gl",
	function()
		require("flash").jump({
			search = { mode = "search", max_length = 0 },
			label = { after = { 0, 0 } },
			pattern = "^"
		})
	end

)
vim.keymap.set('n',
	"gw",
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
	end
)

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

-- LSP configurations

vim.lsp.enable({ "lua_ls" })
vim.keymap.set('n', '<M-f>', vim.lsp.buf.format)

-- Colorschem configurations

vim.cmd("colorschem vague")
-- vim.cmd(":hi statusline guibg=NONE")
