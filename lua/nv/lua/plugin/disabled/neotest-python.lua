local _config = function()
  require("neotest").setup {
    adapters = {
      require "neotest-python",
    },
  }
end

return {
  "nvim-neotest/neotest-python",
  dependencies = {
    "nvim-neotest/neotest",
    "nvim-treesitter/nvim-treesitter",
  },
  config = _config,
  ft = "python",
}
