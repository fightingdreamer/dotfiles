return {
    -- A clean, dark Neovim theme written in Lua
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = true,
        init = function ()
            vim.cmd.colorscheme "tokyonight-night"
        end
    }
}
