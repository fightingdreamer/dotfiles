local m = {
  continue = function()
    require("dap").continue()
  end,

  run_last = function()
    require("dap").run_last()
  end,

  restart = function()
    require("dap").restart()
  end,

  terminate = function()
    require("dap").terminate()
  end,

  toggle_breakpoint = function()
    require("dap").toggle_breakpoint()
  end,

  clear_breakpoints = function()
    require("dap").clear_breakpoints()
  end,

  step_over = function()
    require("dap").step_over()
  end,

  step_into = function()
    require("dap").step_into()
  end,

  step_out = function()
    require("dap").step_out()
  end,

  step_back = function()
    require("dap").step_back()
  end,

  stack_up = function()
    require("dap").up()
  end,

  stack_down = function()
    require("dap").down()
  end,

  run_to_cursor = function()
    require("dap").run_to_cursor()
  end,
}

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },

  keys = {
    { "<leader>dc", m.continue, desc = "stack down" },
    { "<leader>dq", m.terminate, desc = "stack down" },

    { "<leader>db", m.toggle_breakpoint, desc = "set breakpoint" },
    { "<leader>dC", m.clear_breakpoints, desc = "clr every breakpoint" },

    { "<leader>di", m.step_into, desc = "step in" },
    { "<leader>do", m.step_out, desc = "step out" },
    { "<leader>dd", m.step_over, desc = "step over" },
    { "<leader>dt", m.run_to_cursor, desc = "run to cursor" },

    { "<leader>dk", m.stack_up, desc = "stack up" },
    { "<leader>dj", m.stack_down, desc = "stack down" },
  },
}
