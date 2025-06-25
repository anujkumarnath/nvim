return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup UI
            dapui.setup()

            -- Automatically open/close dapui
            dap.listeners.before.attach["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.launch["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            -- Set C++ adapter path
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = vim.fn.stdpath("data") .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
            }

            -- Configuration for launching
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        local exe_path = vim.fn.getcwd() .. '/build/src/game'
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = true,
                    setupCommands = {
                        {
                            description = 'Enable pretty-printing for gdb',
                            text = '-enable-pretty-printing',
                            ignoreFailures = false
                        }
                    },
                }
            }

            dap.configurations.c = dap.configurations.cpp
        end,
    }
}
