return {

    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
        -- local function flash(prompt_bufnr)
        --     require("flash").jump({
        --         pattern = "^",
        --         label = { after = { 0, 0 } },
        --         search = {
        --             mode = "search",
        --             exclude = {
        --                 function(win)
        --                     return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
        --                 end,
        --             },
        --         },
        --         action = function(match)
        --             local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        --             picker:set_selection(match.pos[1] - 1)
        --         end,
        --     })
        -- end
        -- opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        --     mappings = {
        --         n = { s = flash },
        --         i = { ["<c-s>"] = flash },
        --     },
        -- })
    end,
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope find keymaps" })
        vim.keymap.set("n", "<leader>sg", function()
            builtin.live_grep({
                grep_open_files = true
            })
        end, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope Treesitter" })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Definition" })
    end,
}
