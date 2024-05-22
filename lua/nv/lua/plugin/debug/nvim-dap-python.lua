return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", },
  ft = 'python',
  config = function()
    return require "config.nvim-dap-python".config
  end
}
