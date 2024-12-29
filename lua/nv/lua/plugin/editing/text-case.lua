local function opts()
  return {}
end

local function config(_, opts)
  require("textcase").setup(opts)
  require("telescope").load_extension "textcase"
end

return {
  -- An all in one plugin for converting text case in Neovim
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = config,
  opts = opts,
  keys = {
    { "gt", "<cmd>TextCaseOpenTelescope<cr>", desc = "Telescope text case" },
  },
}
