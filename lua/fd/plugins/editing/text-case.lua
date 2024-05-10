return {
    -- An all in one plugin for converting text case in Neovim
    {
        "johmsalas/text-case.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        event = 'VeryLazy',
        opts = {},
        cmd = {
            "ToDashCase",
            "ToSnakeCase",
            "ToPascalCase",
        },
        keys = {
            { '<leader>tC', function() require('textcase').current_word('to_constant_case') end, mode = 'n', desc = 'To "CONSTANT_CASE"' },
            { '<leader>tp', function() require('textcase').current_word('to_pascal_case') end,   mode = 'n', desc = 'To "PascalCase"' },
            { '<leader>tc', function() require('textcase').current_word('to_camel_case') end,    mode = 'n', desc = 'To "camelCase"' },
            { '<leader>tu', function() require('textcase').current_word('to_upper_case') end,    mode = 'n', desc = 'To "UPPER CASE"' },
            { '<leader>tl', function() require('textcase').current_word('to_lower_case') end,    mode = 'n', desc = 'To "lower case"' },
            { '<leader>ts', function() require('textcase').current_word('to_snake_case') end,    mode = 'n', desc = 'To "snake_case"' },
            { '<leader>td', function() require('textcase').current_word('to_dash_case') end,     mode = 'n', desc = 'To "dash-case"' },
            { '<leader>t.', function() require('textcase').current_word('to_dot_case') end,      mode = 'n', desc = 'To "dot.case"' },
            { '<leader>tC', function() require('textcase').operator('to_constant_case') end,     mode = 'v', desc = 'To "CONSTANT_CASE"' },
            { '<leader>tp', function() require('textcase').operator('to_pascal_case') end,       mode = 'v', desc = 'To "PascalCase"' },
            { '<leader>tc', function() require('textcase').operator('to_camel_case') end,        mode = 'v', desc = 'To "camelCase"' },
            { '<leader>tu', function() require('textcase').operator('to_upper_case') end,        mode = 'v', desc = 'To "UPPER CASE"' },
            { '<leader>tl', function() require('textcase').operator('to_lower_case') end,        mode = 'v', desc = 'To "lower case"' },
            { '<leader>ts', function() require('textcase').operator('to_snake_case') end,        mode = 'v', desc = 'To "snake_case"' },
            { '<leader>td', function() require('textcase').operator('to_dash_case') end,         mode = 'v', desc = 'To "dash-case"' },
            { '<leader>t.', function() require('textcase').operator('to_dot_case') end,          mode = 'v', desc = 'To "dot.case"' },
        },
    }
}
