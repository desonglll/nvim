local opts = { noremap = true, silent = true, desc = "Uncomment" }
local keymap = vim.keymap

-- visual模式下缩进代码
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
-- 上下移动选中文本
keymap.set("v", "J", ":move '>+1<cr>gv-gv", { desc = "Move selected text DOWN in context" })
keymap.set("v", "K", ":move '<-2<cr>gv-gv", { desc = "Move selected text UP in context" })
-- Save
keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
keymap.set("v", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true })
keymap.set("i", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>e", ":Neotree toggle<cr>", { desc = "Neotree toggle" })
-- For jump to diagnostics
keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Go to previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next diagnostic" })
keymap.set("n", "<M-d>", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Open diagnostic float" })
keymap.set("n", "<M-cr>", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Show code actions" })

-- for buffer line
-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
keymap.set("n", "<space>bs", ":BufferLinePick<cr>", { desc = "Pick buffer" })
keymap.set("n", "<spcae>bd", ":BufferLinePickClose<cr>", { desc = "Pick buffer close" })
keymap.set("n", "<space>bco", ":BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
-- for telescope
-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
local telescope = require("telescope.builtin")
keymap.set("n", "<space>ff", telescope.find_files, { desc = "Telescope find files" })
keymap.set("n", "<space>fr", telescope.oldfiles, { desc = "Lists previously open files" })
keymap.set("n", "<space>fh", telescope.help_tags, { desc = "Telescope help tags" })
keymap.set("n", "gd", telescope.lsp_definitions, { desc = "lsp_definitions" })
keymap.set("n", "<space>sg", telescope.live_grep, { desc = "Telescope live grep" })
keymap.set("v", "<space>sg", telescope.grep_string, { desc = "Telescope grep string" })
keymap.set("n", "<space>sb", telescope.buffers, { desc = "Lists open buffers in current neovim instance" })
keymap.set("n", "<space>sk", telescope.keymaps, { desc = "Search keymaps" })
keymap.set("n", "<space>sd", function()
	telescope.diagnostics()
end, {
	desc = "Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.",
})
-- keymap.set("n", "<space>fr", telescope.lsp_references, { desc = "Lists LSP references for word under the cursor" })
-- for treesitter
keymap.set("n", "<space>ts", telescope.treesitter, { desc = "Lists Function names, variables, from Treesitter!" })
