return {
    -- Soho vibes for Neovim
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        opts = {
            --- 'auto'|'main'|'moon'|'dawn'
            variant = 'auto',
            --- 'main'|'moon'|'dawn'
            dark_variant = 'moon',
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = false,
        },
        lazy = true,
        init = function()
            vim.cmd.colorscheme "rose-pine"
        end
    },
}
