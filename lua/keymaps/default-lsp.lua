vim.keymap.set('n', 'grn', function()
    vim.lsp.buf.rename()
end, { desc = 'vim.lsp.buf.rename()' })

vim.keymap.set({ 'n', 'x' }, 'gra', function()
    vim.lsp.buf.code_action()
end, { desc = 'vim.lsp.buf.code_action()' })

vim.keymap.set('n', 'grr', function()
    vim.lsp.buf.references()
end, { desc = 'vim.lsp.buf.references()' })

vim.keymap.set('n', 'gri', function()
    vim.lsp.buf.implementation()
end, { desc = 'vim.lsp.buf.implementation()' })

vim.keymap.set('n', 'grt', function()
    vim.lsp.buf.type_definition()
end, { desc = 'vim.lsp.buf.type_definition()' })

vim.keymap.set('x', 'an', function()
    vim.lsp.buf.selection_range(vim.v.count1)
end, { desc = 'vim.lsp.buf.selection_range(vim.v.count1)' })

vim.keymap.set('x', 'in', function()
    vim.lsp.buf.selection_range(-vim.v.count1)
end, { desc = 'vim.lsp.buf.selection_range(-vim.v.count1)' })

vim.keymap.set('n', 'gO', function()
    vim.lsp.buf.document_symbol()
end, { desc = 'vim.lsp.buf.document_symbol()' })

vim.keymap.set({ 'i', 's' }, '<C-S>', function()
    vim.lsp.buf.signature_help()
end, { desc = 'vim.lsp.buf.signature_help()' })
