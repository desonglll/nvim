vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":x<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })

-- Define key mappings using native Neovim API
local keymaps = {
    { "jk",    "<ESC>",               "Exit insert mode",                   "i" },
    { "<c-w>", [[<C-\><C-n><C-w>]],   "Exit terminal mode",                 "t" },
    { "<",     "<gv",                 "Indent left",                        "v" },
    { ">",     ">gv",                 "Indent right",                       "v" },

    -- Move selected text up and down
    { "J",     ":move '>+1<cr>gv-gv", "Move selected text DOWN in context", "v" },
    { "K",     ":move '<-2<cr>gv-gv", "Move selected text UP in context",   "v" },

    -- Save file
    { "<C-s>", ":w<CR>",              "Save file",                          "n" },
    { "<C-s>", "<C-c>:w<CR>",         "Save file in visual mode",           "v" },
    { "<C-s>", "<C-c>:w<CR>",         "Save file in insert mode",           "i" },


    -- LSP and Diagnostics
    {
        "[d",
        function()
            vim.diagnostic.jump({ count = -1, float = true })
        end,
        "Go to previous diagnostic",
        "n",
    },
    {
        "]d",
        function()
            vim.diagnostic.jump({ count = 1, float = true })
        end,
        "Go to next diagnostic",
        "n",
    },
    {
        "<M-d>",
        function()
            vim.diagnostic.open_float()
        end,
        "Open diagnostic float",
        "n",
    },
    {
        "<M-a>",
        function()
            vim.lsp.buf.code_action()
        end,
        "Show code actions",
        "n",
    },
}

-- Apply the key mappings
for _, map in ipairs(keymaps) do
    local lhs, rhs, desc, mode = map[1], map[2], map[3], map[4]
    vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end
