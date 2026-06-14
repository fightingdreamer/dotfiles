-- An extension for nvim-dap providing default configurations for
-- python and methods to debug individual test methods or classes.

-- Example module entrypoint:
--   debugpy --listen localhost:5678 --wait-for-client -m example.cli a b c

-- Example file entrypoint:
-- debugpy --listen localhost:5678 --wait-for-client src/example/cli.py a b c

return {
  "mfussenegger/nvim-dap-python",

  dependencies = {
    "mfussenegger/nvim-dap",
  },

  main = "dap-python",
  config = function(_, opts)
    local module = require "dap-python"
    module.setup(nil, opts)
    module.test_runner = "pytest"
  end,

  ft = "python",
}
