--- vim-unimpaired style mappings. See: https://github.com/tpope/vim-unimpaired
do
    --- Execute a command and print errors without a stacktrace.
    --- @param opts table Arguments to |nvim_cmd()|
    local function cmd(opts)
        local ok, err = pcall(vim.api.nvim_cmd, opts, {})
        if not ok then
            vim.api.nvim_echo({ { err:sub(#'Vim:' + 1) } }, true, { err = true })
        end
    end

    -- Quickfix mappings
    vim.keymap.set('n', '[q', function()
        cmd({ cmd = 'cprevious', count = vim.v.count1 })
    end, { desc = ':cprevious' })

    vim.keymap.set('n', ']q', function()
        cmd({ cmd = 'cnext', count = vim.v.count1 })
    end, { desc = ':cnext' })

    vim.keymap.set('n', '[Q', function()
        cmd({ cmd = 'crewind', count = vim.v.count ~= 0 and vim.v.count or nil })
    end, { desc = ':crewind' })

    vim.keymap.set('n', ']Q', function()
        cmd({ cmd = 'clast', count = vim.v.count ~= 0 and vim.v.count or nil })
    end, { desc = ':clast' })

    vim.keymap.set('n', '[<C-Q>', function()
        cmd({ cmd = 'cpfile', count = vim.v.count1 })
    end, { desc = ':cpfile' })

    vim.keymap.set('n', ']<C-Q>', function()
        cmd({ cmd = 'cnfile', count = vim.v.count1 })
    end, { desc = ':cnfile' })

    -- Location list mappings
    vim.keymap.set('n', '[l', function()
        cmd({ cmd = 'lprevious', count = vim.v.count1 })
    end, { desc = ':lprevious' })

    vim.keymap.set('n', ']l', function()
        cmd({ cmd = 'lnext', count = vim.v.count1 })
    end, { desc = ':lnext' })

    vim.keymap.set('n', '[L', function()
        cmd({ cmd = 'lrewind', count = vim.v.count ~= 0 and vim.v.count or nil })
    end, { desc = ':lrewind' })

    vim.keymap.set('n', ']L', function()
        cmd({ cmd = 'llast', count = vim.v.count ~= 0 and vim.v.count or nil })
    end, { desc = ':llast' })

    vim.keymap.set('n', '[<C-L>', function()
        cmd({ cmd = 'lpfile', count = vim.v.count1 })
    end, { desc = ':lpfile' })

    vim.keymap.set('n', ']<C-L>', function()
        cmd({ cmd = 'lnfile', count = vim.v.count1 })
    end, { desc = ':lnfile' })

    -- Argument list
    vim.keymap.set('n', '[a', function()
        cmd({ cmd = 'previous', count = vim.v.count1 })
    end, { desc = ':previous' })

    vim.keymap.set('n', ']a', function()
        -- count doesn't work with :next, must use range. See #30641.
        cmd({ cmd = 'next', range = { vim.v.count1 } })
    end, { desc = ':next' })

    vim.keymap.set('n', '[A', function()
        if vim.v.count ~= 0 then
            cmd({ cmd = 'argument', count = vim.v.count })
        else
            cmd({ cmd = 'rewind' })
        end
    end, { desc = ':rewind' })

    vim.keymap.set('n', ']A', function()
        if vim.v.count ~= 0 then
            cmd({ cmd = 'argument', count = vim.v.count })
        else
            cmd({ cmd = 'last' })
        end
    end, { desc = ':last' })

    -- Tags
    vim.keymap.set('n', '[t', function()
        -- count doesn't work with :tprevious, must use range. See #30641.
        cmd({ cmd = 'tprevious', range = { vim.v.count1 } })
    end, { desc = ':tprevious' })

    vim.keymap.set('n', ']t', function()
        -- count doesn't work with :tnext, must use range. See #30641.
        cmd({ cmd = 'tnext', range = { vim.v.count1 } })
    end, { desc = ':tnext' })

    vim.keymap.set('n', '[T', function()
        -- count doesn't work with :trewind, must use range. See #30641.
        cmd({ cmd = 'trewind', range = vim.v.count ~= 0 and { vim.v.count } or nil })
    end, { desc = ':trewind' })

    vim.keymap.set('n', ']T', function()
        -- :tlast does not accept a count, so use :trewind if count given
        if vim.v.count ~= 0 then
            cmd({ cmd = 'trewind', range = { vim.v.count } })
        else
            cmd({ cmd = 'tlast' })
        end
    end, { desc = ':tlast' })

    vim.keymap.set('n', '[<C-T>', function()
        -- count doesn't work with :ptprevious, must use range. See #30641.
        cmd({ cmd = 'ptprevious', range = { vim.v.count1 } })
    end, { desc = ' :ptprevious' })

    vim.keymap.set('n', ']<C-T>', function()
        -- count doesn't work with :ptnext, must use range. See #30641.
        cmd({ cmd = 'ptnext', range = { vim.v.count1 } })
    end, { desc = ':ptnext' })

    -- Buffers
    vim.keymap.set('n', '[b', function()
        cmd({ cmd = 'bprevious', count = vim.v.count1 })
    end, { desc = ':bprevious' })

    vim.keymap.set('n', ']b', function()
        cmd({ cmd = 'bnext', count = vim.v.count1 })
    end, { desc = ':bnext' })

    vim.keymap.set('n', '[B', function()
        if vim.v.count ~= 0 then
            cmd({ cmd = 'buffer', count = vim.v.count })
        else
            cmd({ cmd = 'brewind' })
        end
    end, { desc = ':brewind' })

    vim.keymap.set('n', ']B', function()
        if vim.v.count ~= 0 then
            cmd({ cmd = 'buffer', count = vim.v.count })
        else
            cmd({ cmd = 'blast' })
        end
    end, { desc = ':blast' })

    -- Add empty lines
    vim.keymap.set('n', '[<Space>', function()
        -- TODO: update once it is possible to assign a Lua function to options #25672
        vim.go.operatorfunc = "v:lua.require'vim._buf'.space_above"
        return 'g@l'
    end, { expr = true, desc = 'Add empty line above cursor' })

    vim.keymap.set('n', ']<Space>', function()
        -- TODO: update once it is possible to assign a Lua function to options #25672
        vim.go.operatorfunc = "v:lua.require'vim._buf'.space_below"
        return 'g@l'
    end, { expr = true, desc = 'Add empty line below cursor' })
end
