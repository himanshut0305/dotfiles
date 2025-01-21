return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
        },
        config = function()
            require("dap-go").setup()

            -- Keybindings for debugging
            local dap = require("dap")
            vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "Start Debugging" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
        end,
    },
}

