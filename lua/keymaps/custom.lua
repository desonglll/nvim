vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":x<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set('i', '<C-L>', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', {
    desc = ':help CTRL-L-default',
})

vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":resize -2<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("t", "<c-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true })

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "[b", function() vim.cmd([[bprevious]]) end, { noremap = true, silent = true })

vim.keymap.set("n", "]b", function() vim.cmd([[bnext]]) end, { noremap = true, silent = true })

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { noremap = true, silent = true, desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { noremap = true, silent = true, desc = "Go to next diagnostic" })
vim.keymap.set("n", "<M-d>", function() vim.diagnostic.open_float() end,
    { noremap = true, silent = true, desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader-d>", function() vim.diagnostic.open_float() end,
    { noremap = true, silent = true, desc = "Open diagnostic float" })
vim.keymap.set("n", "<M-a>", function() vim.lsp.buf.code_action() end,
    { noremap = true, silent = true, desc = "Show code actions" })

-- LSP keymaps

-- vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-l>", ":<CR>", { noremap = true, silent = true })
