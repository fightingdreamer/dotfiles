local function package_install_path(package_name)
  return require("mason-registry").get_package(package_name):get_install_path()
end

local function pick_process(filter)
  return function()
    require("dap.utils").pick_process { filter = filter }
  end
end

-- # node --inspect index.js

local function node_adapter()
  local path = package_install_path "js-debug-adapter" .. "/js-debug/src/dapDebugServer.js"
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { path, "${port}" },
    },
  }
end

-- # require'dap'.continue() -> attach
-- # require'dap'.set_breakpoint()
-- # require'dap'.step_over()

local function node_config()
  require("dap").configurations.javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch current file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to 'node --inspect' process",
      processId = pick_process "node%s+--inspect",
      cwd = "${workspaceFolder}",
    },
  }
end

local function opts()
  return {}
end

local function config(_, opts)
  require("dap").set_log_level "TRACE"
  node_adapter()
  node_config()
end

return {
  "mfussenegger/nvim-dap",
  config = config,
  opts = opts,
}

-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)
