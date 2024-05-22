local opts = function()
    return {
        cutoff = 100,
    }
end

local config = function(_, opts)
    require('mini.fuzzy').setup(opts)
end

return {
    -- Minimal and fast fuzzy matching algorithm which prioritizes match width.
    'echasnovski/mini.fuzzy',
    version = '*',
    config = config,
    opts = opts,
}
