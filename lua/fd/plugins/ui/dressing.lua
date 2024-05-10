return {
    -- Neovim plugin to improve the default vim.ui interfaces
    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
        opts = {
            input = {
                insert_only = false,
                start_in_insert = false,
            },
            win_options = {
                sidescrolloff = 3,
            },
        },
    }
}
