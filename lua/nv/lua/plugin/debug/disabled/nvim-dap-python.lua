local function opts()
  return {
    debugpy = {
      path = os.getenv "VIRTUAL_ENV" .. "/bin/python",
    },
    test = {
      runner = "pytest",
    },
  }
end

local function config(_, opts)
  local dap_python = require "dap-python"
  dap_python.setup(opts.debugpy.path)
  dap_python.test_runner = opts.test.runner
end

return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
  ft = "python",
  config = config,
}
