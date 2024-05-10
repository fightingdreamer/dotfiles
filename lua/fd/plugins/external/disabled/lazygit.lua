return {
    -- Plugin for calling lazygit from within neovim.
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { '<leader>q', '<cmd>LazyGit<cr>', mode = 'n' },
        },
        opts = {
        }
    },
}
