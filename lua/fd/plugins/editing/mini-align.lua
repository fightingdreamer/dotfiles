return {
    -- Align text interactively
    {
        'echasnovski/mini.align',
        version = false,
        event = "VeryLazy",
        opts = {
            mappings = {
                start = '\\a',
                start_with_preview = '\\A',
            }
        }
    },
}
