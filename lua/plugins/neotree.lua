return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
        buffers = { follow_current_file = { enable = true } },

        filesystem = {
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
        },
        close_if_last_window = true,
        window = {
            bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
            cwd_target = {
                sidebar = "window", -- sidebar is when position = left or right
                current = "window", -- current is when position = current
            },

            position = "left",
            width = 30,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        },

        default_component_configs = {
            git_status = {
                symbols = {
                    -- Change type
                    added = "+", -- 添加
                    deleted = "-", -- 删除
                    modified = "~", -- 修改
                    renamed = "R", -- 重命名

                    -- Status type
                    untracked = "U", -- 未追踪
                    ignored = "i", -- 忽略
                    unstaged = "!", -- 未暂存
                    staged = "s", -- 已暂存
                    conflict = "x", -- 冲突
                },
            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_set_keymap(
            "n",
            "<leader>e",
            ":Neotree toggle<cr>",
            { noremap = true, silent = true }
        )
    end,
}
