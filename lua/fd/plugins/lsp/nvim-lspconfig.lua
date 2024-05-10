local vim_lsp_buf_list_workspace_folders = function()
    vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local vim_lsp_buf_format = function()
    vim.lsp.buf.format { async = true }
end

local vim_lsp_init_keymap = function(buf)
    -- Workspace
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
        { buffer = buf, desc = "lsp.add_workspace_folder" })
    vim.keymap.set('n', '<leader>wl', vim_lsp_buf_list_workspace_folders,
        { buffer = buf, desc = "lsp.list_workspace_folders" })
    vim.keymap.set('n', '<leader>wd', vim.lsp.buf.remove_workspace_folder,
        { buffer = buf, desc = "lsp.remove_workspace_folder" })

    -- Actions
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
        { buffer = buf, desc = "lsp.hover" })
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename,
        { buffer = buf, desc = "lsp.rename" })
    -- vim.keymap.set('n', '<leader>f', vim_lsp_buf_format,
    --     { desc = "lsp.format" })
    vim.keymap.set('n', '<leader>q', vim.lsp.buf.code_action,
        { buffer = buf, desc = "lsp.code_action" })
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "folke/neodev.nvim",
        },
        keys = {
            -- { '<leader>e', vim.diagnostic.open_float, mode = 'n', desc = '' },
            -- { '<leader>q', vim.diagnostic.setqflist,  mode = 'n', desc = '' },
            -- { '<leader>q', vim.diagnostic.setloclist, mode = 'n', desc = '' },
            { '[e', vim.diagnostic.goto_prev, mode = 'n', desc = "Prev diagnostic" },
            { ']e', vim.diagnostic.goto_next, mode = 'n', desc = "Next diagnostic" },
        },
        init = function()
            -- Manual config
            -- local lspconfig = require('lspconfig')
            -- lspconfig.lua_ls.setup {}
            -- lspconfig.pylsp.setup {}
            -- lspconfig.pyright.setup {}
            -- lspconfig.pylyzer.setup {}

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(args)
                    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                    vim_lsp_init_keymap(args.buf)
                end,
            })
        end,
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    }
}
