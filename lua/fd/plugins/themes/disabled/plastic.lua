return {
    -- VSCode Plastic theme port for vim/neovim.
    {
        "flrnd/plastic.vim",
        priority = 1000,
        lazy = true,
        init = function()
            vim.cmd.colorscheme "plastic"
        end
    }
}
