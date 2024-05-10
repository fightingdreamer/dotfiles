return {
    {
        "olimorris/persisted.nvim",
        opts = {
            ignored_dirs = {
                '/'
            },
        },
        keys = {
            { '<leader>s', '<cmd>Telescope persisted<cr>', mode = 'n', desc = 'Open Session' }
        },
        init = function()
            require("telescope").load_extension("persisted")
        end
    }
}
