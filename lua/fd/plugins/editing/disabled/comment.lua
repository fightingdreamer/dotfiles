return {
    -- Smart and powerful comment plugin
    {
        'numToStr/Comment.nvim',
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                dependencies = {
                    "nvim-treesitter/nvim-treesitter",
                }
            }
        },
        event = "VeryLazy",
        opts = function()
            local integation = require('ts_context_commentstring.integrations.comment_nvim')
            return {
                pre_hook = integation.create_pre_hook(),
            }
        end
    }
}
