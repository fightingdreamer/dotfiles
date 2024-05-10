function jump_to_line()
    require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^"
    })
end

-- note: pure vi {count}H -> move cursor {count} lines from top of screen
-- note: pure vi M        -> move cursor to middle of screen
-- note: pure vi {count}L -> move cursor {count} lines from bottom of screen

return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                char = {
                    jump_labels = false
                }
            }
        },
        keys = {
            { "<leader>l", mode = { "n" }, jump_to_line, desc = "Jump to line" }
            -- { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash"},
            -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    }
}
