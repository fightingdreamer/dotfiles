return {
    -- Fast and feature-rich surround actions
    {
        'echasnovski/mini.surround',
        version = false,
        event = "VeryLazy",
        opts = {
            -- Use `''` (empty string) to disable mapping.
            mappings = {
                add = 'S',           -- Add surrounding in Normal and Visual modes
                delete = 'ds',       -- Delete surrounding
                find = '',           -- Find surrounding (to the right)
                find_left = '',      -- Find surrounding (to the left)
                highlight = '',      -- Highlight surrounding
                replace = 'cs',      -- Replace surrounding
                update_n_lines = '', -- Update `n_lines`

                suffix_last = 'l',   -- Suffix to search with "prev" method
                suffix_next = 'n',   -- Suffix to search with "next" method
            },
            -- Number of lines within which surrounding is searched.
            n_lines = 50,
        }
    },
}
