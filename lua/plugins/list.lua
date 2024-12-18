vim.lsp.set_log_level("debug") -- 其他级别可用： "info", "warn", "error"

return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"tpope/vim-surround",

		-- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
		-- setup = function()
		--  vim.o.timeoutlen = 500
		-- end
	},
	{ "tpope/vim-repeat" },
	{
		"felipec/vim-sanegx",
		event = "BufRead",
	},
	{
		"itchyny/vim-cursorword",
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		-- https://github.com/monaqa/dial.nvim
		-- Enchance increment/decrement
		"monaqa/dial.nvim",
		keys = {
			{
				"<C-a>",
				function()
					require("dial.map").manipulate("increment", "normal")
				end,
				mode = "n",
			},
			{
				"<C-x>",
				function()
					require("dial.map").manipulate("decrement", "normal")
				end,
				mode = "n",
			},
			{
				"g<C-a>",
				function()
					require("dial.map").manipulate("increment", "gnormal")
				end,
				mode = "n",
			},
			{
				"g<C-x>",
				function()
					require("dial.map").manipulate("decrement", "gnormal")
				end,
				mode = "n",
			},
			{
				"<C-a>",
				function()
					require("dial.map").manipulate("increment", "visual")
				end,
				mode = "v",
			},
			{
				"<C-x>",
				function()
					require("dial.map").manipulate("decrement", "visual")
				end,
				mode = "v",
			},
			{
				"g<C-a>",
				function()
					require("dial.map").manipulate("increment", "gvisual")
				end,
				mode = "v",
			},
			{
				"g<C-x>",
				function()
					require("dial.map").manipulate("decrement", "gvisual")
				end,
				mode = "v",
			},
		},
	},
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		-- https://github.com/simrat39/symbols-outline.nvim
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
			vim.keymap.set({ "n" }, "<c-k>", function()
				require("lsp_signature").toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},
	{
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = function()
			require("goto-preview").setup({
				default_mappings = true,
			})
		end, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
		-- Default keybinddings.
		-- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
		-- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
		-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
		-- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
		-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
		-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
	},
	{
		"norcalli/nvim-colorizer.lua",
		-- For hex color previewed.
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				-- 打开新终端后自动进入插入模式
				start_in_insert = true,
				-- 在当前buffer的下方打开新终端
				direction = "horizontal",
				-- 设置 float 的宽度和高度
				float_opts = {
					border = "curved", -- 设置浮动窗口的边框样式，可以是 "single", "double", "shadow", 或者其他合法的边框样式
					width = 100, -- 设置浮动窗口的宽度
					height = 30, -- 设置浮动窗口的高度
					winblend = 3, -- 设置浮动窗口的透明度，值范围是 0 到 100，0 表示完全透明，100 表示完全不透明
					highlights = {
						border = "Normal", -- 设置边框的高亮颜色
						background = "Normal", -- 设置浮动窗口的背景颜色
					},
				},
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for lazygit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>lazygit<cr>", desc = "lazygit" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{

				"echasnovski/mini.icons",
				config = function()
					require("mini.icons").setup()
				end,
			},
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "buffer local keymaps (which-key)",
			},
		},
	},
	{
		"magicduck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				-- options, see configuration section below
				-- there are no required options atm
				-- engine = 'ripgrep' is default, but 'astgrep' can be specified
			})
		end,
	},

	{
		-- documentation
		-- https://github.com/mg979/vim-visual-multi
		"mg979/vim-visual-multi",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				window = {
					position = "left",
					width = 25,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
				},
				file_size = {
					enabled = true,
					required_width = 10, -- min width of window required to show this column
				},
				type = {
					enabled = true,
					required_width = 122, -- min width of window required to show this column
				},
				last_modified = {
					enabled = true,
					required_width = 88, -- min width of window required to show this column
				},
				created = {
					enabled = true,
					required_width = 110, -- min width of window required to show this column
				},
				symlink_target = {
					enabled = false,
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"hiphish/rainbow-delimiters.nvim",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme tokyonight]])
		end,
		opts = {},
	},
	{
		"morhetz/gruvbox",
		config = function()
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				},
				ensure_installed = { "c", "lua", "vim", "vimdoc", "rust" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").pyright.setup({})
			require("lspconfig").lua_ls.setup({})
		end,
	},
	{

		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
			"octaltree/cmp-look",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-o>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
							-- this way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
					{ name = "path" },
					{
						name = "look",
					},
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true, -- do not show text alongside icons
						maxwidth = 50,
						before = function(entry, vim_item)
							-- Source 显示提示来源
							vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
							return vim_item
						end,
					}),
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettier" },
				java = { "google-java-formatter" },
				markdown = { "markdown-toc" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local is_aarch64 = vim.fn.system("uname -m"):match("aarch64") ~= nil

			local lsp_list = {
				unpack(is_aarch64 and {} or { "clangd" }), -- 如果是 armlinux，则不安装 clangd
				"lua_ls", -- For Lua
				"ts_ls",
				"bashls",
				"jdtls",
				-- auto install rust_analyzer
			}
			require("mason-lspconfig").setup({
				ensure_installed = lsp_list,
				automatic_installation = true,
			})
			for _, lsp in ipairs(lsp_list) do
				require("lspconfig")[lsp].setup({
					on_attach = function(client, bufnr)
						-- 这里可以添加你的 LSP 相关设置
					end,
					flags = {
						debounce_text_changes = 150,
					},
					-- 可以在这里添加其他配置项
				})
			end
		end,
	},
}
