local function opts()
  return {
    mappings = {
      expand = "<Tab>",
    },
  }
end

-- manual
-- require("dapui").open()
-- require("dapui").close()
-- require("dapui").toggle()

-- auto
-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  opts = opts,
  lazy = false,
}
