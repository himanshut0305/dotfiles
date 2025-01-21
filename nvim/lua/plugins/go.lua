-- Setup Go-specific plugins and tools
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "ray-x/go.nvim", -- Additional Go tools
            "williamboman/mason.nvim",
        },
        config = function()
            require("go").setup({
                gofmt = "gofumpt", -- Use gofumpt for formatting
                max_line_len = 120, -- Set max line length
                lsp_inlay_hints = { enable = true }, -- Enable inlay hints
            })

            -- Configure gopls
            require("lspconfig").gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true, -- Autocomplete for unimported packages
                        usePlaceholders = true, -- Add placeholders for function arguments
                        analyses = {
                            unusedparams = true, -- Warn about unused params
                        },
                    },
                },
                on_attach = function(client, bufnr)
                    -- Keybindings for LSP features
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>ai", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end,
    },
}

