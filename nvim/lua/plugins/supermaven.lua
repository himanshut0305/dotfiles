-- plugins/supermaven.lua
return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                -- Add any specific configuration options here if needed
                auto_start = true, -- Automatically start SuperMaven
                suggestion_mode = "inline", -- Inline suggestions
                keymaps = {
                    next_suggestion = "<C-n>", -- Navigate to the next suggestion
                    prev_suggestion = "<C-p>", -- Navigate to the previous suggestion
                },
            })
        end,
    },
}

