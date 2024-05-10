return {
    {
        "ahmedkhalf/project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        config = '',
        name = 'project_nvim',
        opts = {
            patterns = {
                ".hg",
                ".bzr",
                ".git",
                ".svn",
                "Makefile",
                "package.json",
                "pyproject.toml",
            },
        },
        keys = {
            {
                '<leader>p',
                function()
                    local telescope = require("telescope")
                    telescope.extensions.projects.projects({})
                end,
                mode = 'n',
                desc = 'Find Project'
            },
        },
        init = function()
            require('telescope').load_extension('projects')
        end,
    }
}
