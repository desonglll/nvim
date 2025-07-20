vim.keymap.set("n", "<S-k>", function()
    vim.lsp.buf.hover({
        border = "single",
    })
end)
