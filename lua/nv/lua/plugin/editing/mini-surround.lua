local opts = function()
    return {
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
end

local config = function(_, opts)
    require('mini.surround').setup(opts)
end

return {
    -- Fast and feature-rich surround actions
    'echasnovski/mini.surround',
    version = '*',
    config = config,
    opts = opts,
    keys = {
        { "S",  mode = { 'n', 'v' }, desc = 'Mini-surround insert surround' },
        { "ds", mode = { 'n' },      desc = 'Mini-surround delete surround' },
        { "cs", mode = { 'n' },      desc = 'Mini-surround change surround' },
    },
}
