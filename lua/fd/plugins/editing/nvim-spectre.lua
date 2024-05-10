return {
    -- Global search and replace.
    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            {'<leader>F', '<cmd>:Spectre<cr>', mode = 'n', desc = 'Search and Replace'},
        },
        opts = {}
    }
}
