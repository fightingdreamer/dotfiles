local opts = function()
    return {
        extensions = {
            undo = {
                use_delta = false,
                mappings = {
                    i = {
                        ["<cr>"] = require("telescope-undo.actions").restore,
                    },
                    n = {
                        ["<cr>"] = require("telescope-undo.actions").restore,
                    }
                }
            }
        },
    }
end

local config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
end

return {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = config,
    opts = opts,
    keys = {
        { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Telescope undo" },
    }
}
