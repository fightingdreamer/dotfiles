local m = {
  normal_mode_quick_change = function()
    require("telescope").extensions.textcase.normal_mode_quick_change({})
  end,

  normal_mode_lsp_change = function()
    require("telescope").extensions.textcase.normal_mode_lsp_change({})
  end,

  visual_mode = function()
    require("telescope").extensions.textcase.visual_mode({})
  end,
}

return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },

  config = function(_, opts)
    require("textcase").setup(opts)
    require("telescope").load_extension("textcase")
  end,

  opts = {
    default_keymappings_enabled = true,
    prefix = "gau",
  },

  keys = {
    { "gt", m.normal_mode_quick_change, desc = "Rename word" },
    { "gt", m.visual_mode, desc = "Rename selection", mode = "v" },
    { "<leader>lc", m.normal_mode_lsp_change, desc = "Rename symbol" },
  },
}
