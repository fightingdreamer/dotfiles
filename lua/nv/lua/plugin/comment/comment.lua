local opts = function()
    return {
        ignore = '^$',
        mappings = {
            basic = false,
            extra = false,
        },
    }
end

local config = function(_, opts)
    require('Comment').setup(opts)
end

local comment_count_toggle_linewise = function()
    return vim.v.count == 0 and
        '<Plug>(comment_toggle_linewise_current)'
        or
        '<Plug>(comment_toggle_linewise_count)'
end

local comment_count_toggle_blockwise = function()
    return vim.v.count == 0 and
        '<Plug>(comment_toggle_blockwise_current)'
        or
        '<Plug>(comment_toggle_blockwise_count)'
end

return {
    "numToStr/Comment.nvim",
    config = config,
    keys = {
        { "cl", mode = 'n', comment_count_toggle_linewise,             desc = 'comment toggle current line',      expr = true },
        { "cl", mode = 'x', "<Plug>(comment_toggle_linewise_visual)",  desc = 'comment toggle linewise (visual)' },
        { "cb", mode = 'n', comment_count_toggle_blockwise,            desc = 'comment toggle current block',     expr = true },
        { "cb", mode = 'x', "<Plug>(comment_toggle_blockwise_visual)", desc = 'comment toggle blockwise (visual)' },
    },
    opts = opts,
}
