return {
    -- Work with trailing whitespace
    {
        'echasnovski/mini.trailspace',
        version = false,
        keys = {
            {
                "<leader>d",
                "<cmd>lua MiniTrailspace.trim()<cr>",
                mode = 'n',
                desc = "Remove trailing spaces"
            },
        },
        opts = {},
    },
}
