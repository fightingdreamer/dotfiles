return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'neovim/nvim-lspconfig',
        },
        opts = function()
            -- link: https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
            local null_ls = require('null-ls')
            return {
                sources = {
                    -- code actions
                    -- note: null_ls.builtins.code_actions.<name>,
                    -- null_ls.builtins.code_actions.eslint_d,

                    -- linters
                    -- note: null_ls.builtins.diagnostics.<name>,
                    -- nix
                    null_ls.builtins.diagnostics.statix,
                    null_ls.builtins.diagnostics.deadnix,

                    -- formatters
                    -- note: null_ls.builtins.formatting.<name>,
                }
            }
        end
    }
}
