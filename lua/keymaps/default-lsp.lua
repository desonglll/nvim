--- Default maps for LSP functions.
---
--- These are mapped unconditionally to avoid different behavior depending on whether an LSP
--- client is attached. If no client is attached, or if a server does not support a capability, an
--- error message is displayed rather than exhibiting different behavior.
---
--- See |grr|, |grn|, |gra|, |gri|, |grt| |gO|, |i_CTRL-S|.
do
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
end

--- Map [d and ]d to move to the previous/next diagnostic. Map <C-W>d to open a floating window
--- for the diagnostic under the cursor.
---
--- See |[d-default|, |]d-default|, and |CTRL-W_d-default|.
do
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.jump({ count = vim.v.count1 })
    end, { desc = 'Jump to the next diagnostic in the current buffer' })

    vim.keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -vim.v.count1 })
    end, { desc = 'Jump to the previous diagnostic in the current buffer' })

    vim.keymap.set('n', ']D', function()
        vim.diagnostic.jump({ count = vim._maxint, wrap = false })
    end, { desc = 'Jump to the last diagnostic in the current buffer' })

    vim.keymap.set('n', '[D', function()
        vim.diagnostic.jump({ count = -vim._maxint, wrap = false })
    end, { desc = 'Jump to the first diagnostic in the current buffer' })

    vim.keymap.set('n', '<C-W>d', function()
        vim.diagnostic.open_float()
    end, { desc = 'Show diagnostics under the cursor' })

    vim.keymap.set(
        'n',
        '<C-W><C-D>',
        '<C-W>d',
        { remap = true, desc = 'Show diagnostics under the cursor' }
    )
end
