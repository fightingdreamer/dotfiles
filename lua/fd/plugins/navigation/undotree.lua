return {
    {
        -- The undo history visualizer for VIM
        "mbbill/undotree",
        keys = {
            {
                '<leader>;',
                '<cmd>UndotreeToggle<cr>',
                mode = 'n',
                desc = "Undo tree",
            }
        },
        init = function()
            vim.g.undotree_SetFocusWhenToggle = 1
            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_SplitWidth = 36
            vim.g.undotree_DiffAutoOpen = 0
            vim.g.undotree_DiffCommand = "diff -u"
        end
    },
}
