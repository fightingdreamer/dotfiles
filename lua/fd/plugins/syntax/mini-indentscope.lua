return {
    -- Visualize and work with indent scope
    {
        'echasnovski/mini.indentscope',
        version = false,
        event = "VeryLazy",
        opts = {
            draw = {
                animation = function() return 0 end,
            }
        }
    },
}
