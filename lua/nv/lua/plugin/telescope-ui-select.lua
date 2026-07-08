return {
  "nvim-telescope/telescope-ui-select.nvim",

  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },

  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "ui-select"
  end,

  opts = {
    extensions = {
      ["ui-select"] = {
        override_generic_sorter = false,
        override_file_sorter = false,
      },
    },
  },

  event = "VeryLazy",
}
