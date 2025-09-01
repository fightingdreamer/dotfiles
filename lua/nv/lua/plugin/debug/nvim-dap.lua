local _dap_continue = function()
  local dap = require "dap"
  dap.continue()
end

local _dap_run = function()
  local dap = require "dap"
  dap.run()
end

local _dap_run_last = function()
  local dap = require "dap"
  dap.run_last()
end

local _dap_restart = function()
  local dap = require "dap"
  dap.restart()
end

local _dap_terminate = function()
  local dap = require "dap"
  dap.terminate()
end

local _dap_toggle_breakpoint = function()
  local dap = require "dap"
  dap.toggle_breakpoint()
end

local _dap_clear_breakpoints = function()
  local dap = require "dap"
  dap.clear_breakpoints()
end

local _dap_step_over = function()
  local dap = require "dap"
  dap.step_over()
end

local _dap_step_into = function()
  local dap = require "dap"
  dap.step_into()
end

local _dap_step_out = function()
  local dap = require "dap"
  dap.step_out()
end

local _dap_step_back = function()
  local dap = require "dap"
  dap.step_back()
end

local _dap_stack_up = function()
  local dap = require "dap"
  dap.up()
end

local _dap_stack_down = function()
  local dap = require "dap"
  dap.down()
end

local _dap_run_to_cursor = function()
  local dap = require "dap"
  dap.run_to_cursor()
end

return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>db", _dap_toggle_breakpoint },
    { "<leader>dc", _dap_clear_breakpoints },
    { "<leader>dI", _dap_step_into, desc = "step in" },
    { "<leader>dO", _dap_step_out, desc = "step out" },
    { "<leader>do", _dap_step_over, desc = "step over" },
    { "<leader>dt", _dap_run_to_cursor, desc = "run to cursor" },
    { "<leader>du", _dap_stack_up, desc = "stack up" },
    { "<leader>dd", _dap_stack_down, desc = "stack down" },
  },
  cmd = {
    "DapContinue",
  },
}
