return {
    {
        'echasnovski/mini.comment',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        version = false,
        event = 'VeryLazy',
        opts = function()
            return {
                options = {
                    custom_commentstring = function()
                        local module = require('ts_context_commentstring')
                        return module.calculate_commentstring() or vim.bo.commentstring
                    end,
                },
            }
        end
    }
}
