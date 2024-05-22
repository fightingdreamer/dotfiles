local opts = function()
    return {}
end

local config = function(_, opts)
    require('nvim-web-devicons').setup(opts)
end

return {
    -- Adds file type icons to Vim plugins.
    "nvim-tree/nvim-web-devicons",
    config = config,
    opts = opts
}
