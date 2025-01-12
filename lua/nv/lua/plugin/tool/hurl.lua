local function opts()
  return {
    mode = "split",
    debug = false,
    auto_close = false,
    show_notification = false,
    -- Split options
    split_position = "right",
    split_size = "50%",
    -- Popup options
    popup_position = "50%",
    popup_size = {
      width = 80,
      height = 40,
    },
    -- Env file
    env_file = { "vars.env" },
    formatters = {
      json = { "jq" },
      html = { "prettier", "--parser", "html" },
      xml = { "tidy", "-xml", "-i", "-q" },
    },
    mappings = {
      close = "q",
      -- Move to the next response popup window
      next_panel = "<C-n>",
      -- Move to the previous response popup window
      prev_panel = "<C-p>",
    },
  }
end

return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = opts,
  keys = {
    -- Run API request
    -- { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    -- { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
    -- { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    -- { "<leader>tE", "<cmd>HurlRunnerToEnd<CR>", desc = "Run Api request from current entry to end" },
    -- { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
    -- { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
    -- { "<leader>tV", "<cmd>HurlVeryVerbose<CR>", desc = "Run Api in very verbose mode" },
    -- Run Hurl request in visual mode
    -- { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
  },
  ft = "hurl",
}
