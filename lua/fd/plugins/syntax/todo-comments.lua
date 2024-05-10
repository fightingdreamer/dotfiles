return {
    {
        -- Previews:

        -- idea: idea
        --       lorem ipsum dolor sit amet
        --
        -- link: link
        --       lorem ipsum dolor sit amet

        -- note: note
        --       lorem ipsum dolor sit amet

        -- warn: warn
        --       lorem ipsum dolor sit amet

        -- perf: perf
        --       lorem ipsum dolor sit amet

        -- test: test
        --       lorem ipsum dolor sit amet

        "folke/todo-comments.nvim",
        dependencies = {
            "folke/trouble.nvim",
        },
        event = 'VeryLazy',
        opts = {
            keywords = {
                -- https://www.nerdfonts.com/cheat-sheet
                -- double                           
                -- single 󰙨
                idea = { icon = " ", color = "info" },
                link = { icon = " ", color = "hint" },
                note = { icon = " ", color = "info" },
                warn = { icon = " ", color = "warning" },
                perf = { icon = " ", color = "hint" },
                test = { icon = " ", color = "test" },
            },
            merge_keywords = false,
            highlight = {
                multiline = true,
                multiline_pattern = "^      .",
                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
                keyword = "wide_fg",
                -- "fg" or "bg" or empty.
                after = "fg",
                comments_only = false,
            },
        },
        keys = {
            { '<leader>T', '<cmd>TodoTrouble<cr>', mode = 'n', desc = "Show todo comments", },
            {
                ']t',
                function()
                    require("todo-comments").jump_next()
                end,
                mode = 'n',
                desc = "Next todo comment",
            },
            {
                '[t',
                function()
                    require("todo-comments").jump_prev()
                end,
                mode = 'n',
                desc = "Previous todo comment",
            },
        },
    }
}
