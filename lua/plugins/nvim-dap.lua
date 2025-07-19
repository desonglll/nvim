return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    opts = function()
        vim.keymap.set("n", "<F5>", function()
            require("dap").continue()
        end, { desc = "Start/Continue Debugging" })
        vim.keymap.set("n", "<F10>", function()
            require("dap").step_over()
        end, { desc = "Step Over" })
        vim.keymap.set("n", "<F11>", function()
            require("dap").step_into()
        end, { desc = "Step Into" })
        vim.keymap.set("n", "<F12>", function()
            require("dap").step_out()
        end, { desc = "Step Out" })

        vim.keymap.set("n", "<Leader>b", function()
            require("dap").toggle_breakpoint()
        end, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>B", function()
            require("dap").set_breakpoint()
        end, { desc = "Set Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>lp", function()
            require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "Set Log Point" })

        vim.keymap.set("n", "<Leader>dr", function()
            require("dap").repl.open()
        end, { desc = "Open REPL" })
        vim.keymap.set("n", "<Leader>dl", function()
            require("dap").run_last()
        end, { desc = "Run Last" })

        vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
            require("dap.ui.widgets").hover()
        end, { desc = "Hover Variable (DAP UI)" })

        vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
            require("dap.ui.widgets").preview()
        end, { desc = "Preview Variable (DAP UI)" })

        vim.keymap.set("n", "<Leader>df", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end, { desc = "Show Call Stack (DAP UI)" })

        vim.keymap.set("n", "<Leader>ds", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end, { desc = "Show Scopes (DAP UI)" })
    end,
    config = function()
        require("lazydev").setup({
            library = { "nvim-dap-ui" },
        })
        require("dapui").setup()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.lldb = {
            type = "executable",
            command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- adjust as needed, must be absolute path
            name = "lldb",
        }
        dap.configurations.c = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.rust = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/target/debug/",
                        "file"
                    )
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
    end,
}
