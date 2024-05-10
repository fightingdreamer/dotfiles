return {
    {
        "Lokaltog/vim-monotone",
        priority = 1000,
        lazy = false,
        init = function()
            vim.opt.background = 'light'
            vim.cmd.colorscheme "monotone"
        end
    }
}

