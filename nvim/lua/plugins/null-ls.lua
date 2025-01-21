-- Configure null-ls for formatting and code actions
return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required dependency for null-ls
    },
    opts = function(_, opts)
        local null_ls = require("null-ls")

        opts.sources = {
            -- Format Go code using goimports-reviser
            null_ls.builtins.formatting.goimports_reviser.with({
                extra_args = { "--imports-order=std,dep,project" },
            }),

            -- Additional Go formatting with gofumpt (stricter formatting)
            null_ls.builtins.formatting.gofumpt,

            -- Enable code actions from gopls (if needed)
            null_ls.builtins.code_actions.gomodifytags, -- Example code action
            null_ls.builtins.code_actions.impl, -- Generate interface stubs
        }

        -- Set up automatic formatting on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
}

