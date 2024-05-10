return {
    -- An extensible framework for interacting with tests within NeoVim.
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- "antoinemadec/FixCursorHold.nvim"

            -- link: https://github.com/nvim-neotest/neotest#supported-runners
            { "/Users/patryk/Projects.forks/neotest-vitest/", dev = true },
            -- "marilari88/neotest-vitest",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-vitest"),
                }
            })
        end,
        event = "LspAttach",
    }
}
