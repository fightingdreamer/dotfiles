return {
    {
        "vyshane/cleanroom-vim-color",
        priority = 1000,
        lazy = false,
        init = function()
            vim.cmd.colorscheme "cleanroom"
        end
    }
}
