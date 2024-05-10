return {
    -- Debug Adapter Protocol client implementation for Neovim.
    {
        -- note: pip install debugpy
        "mfussenegger/nvim-dap",
        dependencies = {
        },
        config = function(_, opts)
        end,
        opts = {},
        lazy = false,
        keys = {
            { "<leader>S",   mode = { "n" }, function() require("dap").continue() end,          desc = "Continue" },
            { "<leader>N",   mode = { "n" }, function() require("dap").step_over() end,         desc = "Step over" },
            { "<leader>\\>", mode = { "n" }, function() require("dap").step_into() end,         desc = "Step into" },
            { "<leader>\\<", mode = { "n" }, function() require("dap").step_out() end,          desc = "Step out" },
            { "<leader>B",   mode = { "n" }, function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        }
    },
    -- An extension for nvim-dap, providing default configurations for python and methods to debug individual test methods or classes.
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function(_, opts)
            local dap_python = require('dap-python')
            dap_python.test_runner = 'pytest'
        end,
        opts = {},
        lazy = false,
        keys = {
            -- { "<leader>M", mode = { "n" }, function() require('dap-python').test_method() end,     desc = "Test method" },
            -- { "<leader>M", mode = { "n" }, function() require('dap-python').test_class() end,      desc = "Test class" },
            -- { "<leader>M", mode = { "n" }, function() require('dap-python').debug_selection() end, desc = "Test selection" },
        }
    },
}
