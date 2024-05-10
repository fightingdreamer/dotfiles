return {
    {
        "mcchrish/zenbones.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        priority = 1000,
        lazy = false,
        init = function()
            -- light
            vim.opt.background = 'light'
            vim.cmd.colorscheme "zenbones"
            
            -- dark
            -- vim.opt.background = 'dark'
            -- vim.cmd.colorscheme "zenwritten"    -- neutral
            -- vim.cmd.colorscheme "kanagawabones" -- gold
        end
    }
}
