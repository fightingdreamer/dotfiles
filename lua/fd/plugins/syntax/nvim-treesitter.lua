local ensure_installed = {
    "bash",
    "c", "cmake", "cpp", "css", "csv",
    "diff",
    "fish",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "gpg", "graphql",
    "html", "http",
    "ini",
    "java", "javascript", "jq", "json", "json5", "jsonc",
    "kdl",
    "lua", "luap",
    "make", "markdown", "meson",
    "nix",
    "objc",
    "pug", "python",
    "regex",
    "scss", "ssh_config", "svelte",
    "toml", "tsv", "tsx", "typescript", "vim",
    "vimdoc", "vue",
    "xml",
    "yaml",
    "zig",
}

return {
    -- Nvim Treesitter configurations and abstraction layer
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            -- require "nvim-treesitter.parsers".get_parser_configs().caddy = {
            --     install_info = {
            --         url = "https://github.com/Samonitari/tree-sitter-caddy.git", -- local path or git repo
            --         files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
            --         -- optional entries:
            --         branch = "master",        -- default branch in case of git repo if different from master
            --         generate_requires_npm = false, -- if stand-alone parser without npm dependencies
            --         requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
            --     },
            --     filetype = "caddy",            -- if filetype does not match the parser name
            -- }
            require("nvim-treesitter.configs").setup({
                ensure_installed = ensure_installed,
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { disable = { "vue", "typescript", "javascript", "python" } },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- set to `false` to disable one of the mappings
                        init_selection = false,
                        node_incremental = "+",
                        node_decremental = "_",
                        scope_incremental = false,
                    },
                },
            })
        end,
        init = function()
            vim.o.foldenable = true
            vim.o.foldlevel = 99
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function(_, opts)
            require 'nvim-treesitter.configs'.setup(opts)
        end,
        event = 'VeryLazy',
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        -- You can optionally set descriptions to the mappings (used in the desc parameter of
                        -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    -- You can choose the select mode (default is charwise 'v')
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.inner'] = 'v',  -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    include_surrounding_whitespace = false,
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["]a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["[a"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        --
                        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                        -- ["]o"] = "@loop.*",
                        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                        --
                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        -- ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        -- ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        -- ["[]"] = "@class.outer",
                    },
                    -- Below will go to either the start or the end, whichever is closer.
                    -- Use if you want more granular movements
                    -- Make it even more gradual by adding multiple queries and regex.
                    goto_next = {
                        ["]d"] = "@conditional.outer",
                    },
                    goto_previous = {
                        ["[d"] = "@conditional.outer",
                    }
                },
                -- lsp_interop = {
                --     enable = true,
                --     border = 'none',
                --     floating_preview_opts = {},
                --     peek_definition_code = {
                --         ["<leader>df"] = "@function.outer",
                --         ["<leader>dF"] = "@class.outer",
                --     },
                -- },
            },
        }
    }
}
