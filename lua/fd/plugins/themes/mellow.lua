return {
    {
        "kvrohit/mellow.nvim",
        priority = 1000,
        lazy = false,
        init = function()
            vim.cmd.colorscheme "mellow"
        end
    }
}
