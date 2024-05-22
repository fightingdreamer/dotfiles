local opts = function()
  return {
    extensions = {
      file_browser = {},
    },
  }
end

local config = function(_, opts)
  require("telescope").setup(opts)
  require("telescope").load_extension "file_browser"
end

return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = config,
  opts = opts,
  keys = {
    { "<leader>p", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope file browser" },
  },
}
