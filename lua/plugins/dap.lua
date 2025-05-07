return {
    -- DAP core plugin
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "igorlfs/nvim-dap-view",  opts = {} },
        },
        config = function()
            local dap = require("dap")

            -- Adapter configuration for codelldb (installed via Mason)
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Mason's codelldb path
                    args = { "--port", "${port}" },
                },
            }

            -- Configuration for C++ debugging
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {}, -- Optional: Add program arguments
                    runInTerminal = false,
                },
            }

            -- Reuse configuration for C and Rust
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- Keybindings
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
            vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>w", "<cmd>DapViewWatch<CR>")
            vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })


            -- vim.keymap.set('n', "<leader>rr", function()
            --     require('dapui').open({ reset = true })
            -- end, { desc = 'Refresh DAP UI' })
            local dv = require("dap-view")
            dap.listeners.before.attach["dap-view-config"] = function()
                dv.open()
            end
            dap.listeners.before.launch["dap-view-config"] = function()
                dv.open()
            end
            dap.listeners.before.event_terminated["dap-view-config"] = function()
                dv.close()
            end
            dap.listeners.before.event_exited["dap-view-config"] = function()
                dv.close()
            end
        end,
    },
}
