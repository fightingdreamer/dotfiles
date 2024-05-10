return {
    -- Neovim plugin to manage the file system and other tree like structures.
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = { 'Neotree'},
        branch = "v3.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            sort_function = function(a, b)
                -- show files before directories
                if a.type ~= b.type then
                    return a.type == "file"
                end
                -- default path sort
                return a.path < b.path
            end,
        }
    }
}
