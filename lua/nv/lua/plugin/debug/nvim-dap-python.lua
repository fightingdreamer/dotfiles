local function _opts()
  return {}
end

local function _config(_, opts)
  local dap_python = require "dap-python"
  dap_python.setup(nil, opts)
  dap_python.test_runner = "pytest"
end

-- entrypoint module:
-- debugpy --listen localhost:5678 --wait-for-client -m example.cli a b c
-- entrypoint file:
-- debugpy --listen localhost:5678 --wait-for-client src/example/cli.py a b c

return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = _config,
  opts = _opts(),
  ft = "python",
}
