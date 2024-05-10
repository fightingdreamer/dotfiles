return {
    -- Soothing pastel theme for (Neo)vim
    {
        "catppuccin/nvim",
        priority = 1000,
        name = 'catppuccin',
        lazy = true,
        init = function()
            vim.cmd.colorscheme "catppuccin-mocha"
            -- vim.cmd.colorscheme "catppuccin-macchiato"
            -- vim.cmd.colorscheme "catppuccin-frappe"
        end
    }
}
