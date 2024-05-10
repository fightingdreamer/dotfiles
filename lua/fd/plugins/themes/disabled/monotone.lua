return {
    {
        "Lokaltog/monotone.nvim",
        dependencies = {
            'rktjmp/lush.nvim'
        },
        priority = 1000,
        lazy = false,
        init = function()
            vim.g.monotone_h = 25
            vim.g.monotone_s = 22
            vim.g.monotone_l = 93
            vim.g.monotone_contrast = 90
            -- vim.g.monotone_true_monotone = true
            vim.opt.background = 'light'
            vim.cmd.colorscheme "monotone"
        end
    }
}
