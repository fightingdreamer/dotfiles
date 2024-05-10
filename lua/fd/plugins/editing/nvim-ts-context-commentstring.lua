return {
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        version = false,
        event = 'VeryLazy',
        opts = {},
        init = function()
            vim.g.skip_ts_context_commentstring_module = true
        end
    }
}
