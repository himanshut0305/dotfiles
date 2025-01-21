-- Ensure necessary tools are installed with Mason
return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "gopls", -- Go language server
            "goimports-reviser", -- Go formatter with auto-imports
            "delve", -- Debugger for Go
        },
    },
}

