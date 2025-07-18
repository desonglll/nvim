vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit buffer" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { noremap = true, silent = true, desc = "Save and quit buffer" })

-- Clear search highlights, update diff, and redraw screen in insert mode
vim.keymap.set('i', '<C-L>', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', {
    desc = "Clear search, update diff, redraw"
})

-- Window resize
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize window left" })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize window right" })
vim.keymap.set("n", "<C-j>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize window down" })
vim.keymap.set("n", "<C-k>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize window up" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode (jk)" })

-- Terminal mode: switch to normal window mode
vim.keymap.set("t", "<c-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true, desc = "Terminal window switch" })

-- Indent and keep selection in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left (keep visual)" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right (keep visual)" })

-- Move lines in visual mode
vim.keymap.set("v", "J", ":move '>+1<cr>gv-gv", { noremap = true, silent = true, desc = "Move line(s) down" })
vim.keymap.set("v", "K", ":move '<-2<cr>gv-gv", { noremap = true, silent = true, desc = "Move line(s) up" })

-- Save file in normal and visual mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("v", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true, desc = "Save file (visual)" })

-- Buffer navigation
vim.keymap.set("n", "[b", function() vim.cmd([[bprevious]]) end,
    { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "]b", function() vim.cmd([[bnext]]) end, { noremap = true, silent = true, desc = "Next buffer" })

-- Diagnostic navigation
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { noremap = true, silent = true, desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { noremap = true, silent = true, desc = "Next diagnostic" })
vim.keymap.set("n", "<M-d>", function() vim.diagnostic.open_float() end,
    { noremap = true, silent = true, desc = "Show diagnostics (float)" })
vim.keymap.set("n", "<leader-d>", function() vim.diagnostic.open_float() end,
    { noremap = true, silent = true, desc = "Show diagnostics (float)" })

-- LSP code actions
vim.keymap.set("n", "<M-a>", function() vim.lsp.buf.code_action() end,
    { noremap = true, silent = true, desc = "LSP code actions" })
