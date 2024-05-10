return {
    -- A pretty list for showing diagnostics
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            group = true,
            auto_preview = false,
            cycle_results = false,
        },
        keys = {
            { "<leader>E", "<cmd>Trouble workspace_diagnostics<cr>", mode = "n", desc = "Trouble workspace" },
            { "<leader>e", "<cmd>Trouble document_diagnostics<cr>", mode = "n", desc = "Trouble document" },
        },
    }
}
