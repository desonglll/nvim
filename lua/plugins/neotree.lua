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
        close_if_last_window = true,
        window = {
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
                    added     = "+", -- 添加
                    deleted   = "-", -- 删除
                    modified  = "~", -- 修改
                    renamed   = "→", -- 重命名

                    -- Status type
                    untracked = "?", -- 未追踪
                    ignored   = "◌", -- 忽略
                    unstaged  = "!", -- 未暂存
                    staged    = "✓", -- 已暂存
                    conflict  = "✗", -- 冲突
                }
            }
        }

    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<cr>", { noremap = true, silent = true })
    end,
}
