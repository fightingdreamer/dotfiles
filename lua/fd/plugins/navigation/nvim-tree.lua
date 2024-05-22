return {
    -- A file explorer tree for neovim written in lua.
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { '<leader>A', '<cmd>NvimTreeFocus<cr>',          mode = 'n', desc = ":NvimTree" },
            { '<leader>a', '<cmd>NvimTreeFindFileToggle<cr>', mode = 'n', desc = ":NvimTree" },
        },
        opts = {
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
            },
            git = {
                enable = true,
            },
            filters = {
                git_ignored = true,
            },
            renderer = {
                icons = {
                    show = {
                        git = false,
                        file = false,
                        folder = false,
                        folder_arrow = true,
                        modified = false,
                        bookmarks = true,
                        diagnostics = false,
                    },
                },
            },
            sort = {
                files_first = true
            },
            view = {
                centralize_selection = true,
                width = 60,
            },
            ui = {
                confirm = {
                    remove = true,
                }
            },
        }
    },
}
