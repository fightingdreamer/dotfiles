return {
  "nvim-telescope/telescope-fzy-native.nvim",

  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },

  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "fzy_native"
  end,

  opts = {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = false,
      },
    },
  },

  event = "VeryLazy",
}
