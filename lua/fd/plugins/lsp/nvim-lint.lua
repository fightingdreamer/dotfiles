return {
    -- An asynchronous linter plugin.
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        event = "VeryLazy",
        config = function(_, opts)
            local lint = require("lint")
            lint.linters_by_ft = opts.linters_by_ft
            vim.api.nvim_create_autocmd(opts.events, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
        opts = {
            events = {
                "BufReadPost",
                "BufWritePost",
                "TextChanged",
                "TextChangedI",
            },
            -- link: https://github.com/mfussenegger/nvim-lint/tree/master/lua/lint/linters
            linters_by_ft = {
                -- vue = { "eslint" },
                fish = { "fish" },
                -- python = { "ruff" },
                -- javascript = { "eslint" },
                -- typescript = { "eslint" },
            },
        },
    }
}
