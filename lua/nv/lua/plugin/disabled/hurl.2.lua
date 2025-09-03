local function opts()
  return {}
end

local function config(_, opts)
  require("hurl").setup(opts)
end

return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = config,
  opts = opts,
  keys = {
    { "<leader>A", "<cmd>HurlRunner<CR>", desc = "hurl run all requests" },
    { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "hurl run api request" },
    { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "hurl run api request to entry" },
    { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "hurl toggle mode" },
    { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "hurl run api in verbose mode" },
    -- Run Hurl request in visual mode
    { "<leader>h", ":HurlRunner<CR>", desc = "hurl runner", mode = "v" },
  },
  cmd = { "HurlRunner" },
  ft = "hurl",
}
