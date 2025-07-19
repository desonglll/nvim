--- Default maps for built-in commenting.
---
--- See |gc-default| and |gcc-default|.
do
    local operator_rhs = function()
        return require("vim._comment").operator()
    end
    vim.keymap.set({ "n", "x" }, "gc", operator_rhs, { expr = true, desc = "Toggle comment" })

    local line_rhs = function()
        return require("vim._comment").operator() .. "_"
    end
    vim.keymap.set("n", "gcc", line_rhs, { expr = true, desc = "Toggle comment line" })

    local textobject_rhs = function()
        require("vim._comment").textobject()
    end
    vim.keymap.set({ "o" }, "gc", textobject_rhs, { desc = "Comment textobject" })
end
