return {
    {
        'natecraddock/telescope-zf-native.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        -- config = function()
        --     require('telescope').load_extension('zf-native')
        -- end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        -- config = function()
        --     require('telescope').load_extension('fzf')
        -- end
    },
    -- Find, Filter, Preview, Pick. All lua, all the time.
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function(_, opts)
            require('telescope').setup(opts)
        end,
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "__VLS_types.d.ts",
                },
                color_devicons = false,
                path_display = { "truncate" },
            },
            pickers = {
                help_tags = {
                    mappings = {
                        i = {
                            ["<cr>"] = "select_vertical",
                        },
                    },
                }
            },
            extensions = {
                -- fzf = {
                --     fuzzy = true,
                --     override_generic_sorter = true,
                --     override_file_sorter = false,
                --     case_mode = "smart_case",
                -- },
                -- ["zf-native"] = {
                --     file = {
                --         enable = true,
                --         highlight_results = true,
                --         match_filename = true,
                --     },
                --     generic = {
                --         enable = false,
                --         highlight_results = true,
                --         match_filename = false,
                --     },
                -- }
            }
        },
        keys = {
            -- general
            {
                '<leader>o',
                function()
                    local builtin = require("telescope.builtin")
                    -- local sorters = require("telescope.sorters")
                    builtin.git_files({
                        show_untracked = true,
                        -- sorter = sorters.fuzzy_with_index_bias(),
                    })
                end,
                mode = 'n',
                desc = 'find git files'
            },
            {
                '<leader>O',
                function()
                    local utils = require("telescope.utils")
                    local builtin = require("telescope.builtin")
                    -- local sorters = require("telescope.sorters")
                    builtin.find_files({
                        hidden = true,
                        no_ignore = true,
                        cwd = utils.buffer_dir(),
                        -- sorter = sorters.fuzzy_with_index_bias(),
                    })
                end,
                mode = 'n',
                desc = 'find files'
            },
            {
                '<leader>g',
                function()
                    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
                    local builtin = require("telescope.builtin")
                    if vim.v.shell_error == 0 then
                        builtin.live_grep({ cwd = root })
                    end
                end,
                mode = 'n',
                desc = 'git global grep'
            },
            {
                '<leader>G',
                function()
                    local utils = require("telescope.utils")
                    local builtin = require("telescope.builtin")
                    builtin.live_grep({ cwd = utils.buffer_dir() })
                end,
                mode = 'n',
                desc = 'global grep'
            },
            {
                '<leader>b',
                function()
                    local builtin = require("telescope.builtin")
                    -- local sorters = require("telescope.sorters")
                    builtin.buffers({
                        -- sorter = sorters.fuzzy_with_index_bias(),
                    })
                end,
                mode = 'n',
                desc = 'buffers'
            },
            {
                '<leader>h',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.help_tags {
                    }
                end,
                mode = 'n',
                desc = 'help pages'
            },
            {
                '<leader>m',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.man_pages({
                        man_cmd = { "apropos", ".*" },
                        sections = { "ALL" },
                    })
                end,
                mode = 'n',
                desc = "man pages"
            },
            {
                '<leader>r',
                function()
                    local builtin = require("telescope.builtin")
                    -- local sorters = require("telescope.sorters")
                    builtin.oldfiles({
                        -- sorter = sorters.fuzzy_with_index_bias(),
                        tiebreak = function(current_entry, existing_entry, _)
                            return current_entry.index < existing_entry.index
                        end
                    }
                    )
                end,
                mode = 'n',
                desc = 'recent files'
            },
            {
                '<leader>j',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.jumplist({ trim_text = false, show_line = false })
                end,
                mode = 'n',
                desc = 'jumplist'
            },
            {
                '<leader>C',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.colorscheme()
                end,
                mode = 'n',
                desc = 'color scheme'
            },
            {
                '<leader>:',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.command_history()
                end,
                mode = 'n',
                desc = 'command history'
            },
            {
                '<leader>/',
                function()
                    local builtin = require("telescope.builtin")
                    local sorters = require("telescope.sorters")
                    builtin.current_buffer_fuzzy_find({
                        previewer = false,
                        sorter = sorters.get_substr_matcher(),
                        sorting_strategy = 'ascending'
                    })
                end,
                mode = 'n',
                desc = 'buffer grep'
            },
            {
                '<leader>y',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.registers()
                end,
                mode = 'n',
                desc = 'registers'
            },
            {
                '<leader>q',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.quickfix()
                end,
                mode = 'n',
                desc = 'quickfix'
            },
            -- { '<leader>', ':Telescope resume<cr>',                                  mode = 'n' },
            -- lsp
            {
                'gr',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_references()
                end,
                mode = 'n',
                desc = 'lsp references'
            },
            {
                'gs',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_document_symbols()
                end,
                mode = 'n',
                desc = 'lsp document symbols'
            },
            {
                'gS',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_dynamic_workspace_symbols()
                end,
                mode = 'n',
                desc = 'lsp workspace symbols'
            },
            {
                'gi',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_incoming_calls()
                end,
                mode = 'n',
                desc = 'lsp incoming calls'
            },
            {
                'go',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_outgoing_calls()
                end,
                mode = 'n',
                desc = "lsp outgoing calls"
            },
            {
                'gd',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_definitions()
                end,
                mode = 'n',
                desc = "lsp definitions"
            },
            {
                'gT',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.lsp_type_definitions()
                end,
                mode = 'n',
                desc = "lsp type definitions"
            },
            {
                'gC',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.git_commits()
                end,
                mode = 'n',
                desc = "git commits"
            },
            {
                'gB',
                function()
                    local builtin = require("telescope.builtin")
                    builtin.git_branches()
                end,
                mode = 'n',
                desc = "git branches"
            },
        }
    },
}
