-- A UI for nvim-dap which is good looking.

local m = {
  toggle = function()
    require("dapui").toggle()
  end,
}

return {
  "rcarriga/nvim-dap-ui",

  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },

  ---@module 'dapui'
  ---@type dapui.Config
  opts = {
    controls = {
      enabled = false,
    },
    layouts = {
      {
        elements = {
          {
            id = "stacks",
            size = 0.20,
          },
          {
            id = "scopes",
            size = 0.60,
          },
          {
            id = "breakpoints",
            size = 0.20,
          },
          -- {
          --   id = "watches",
          --   size = 0.25,
          -- },
        },
        position = "left",
        size = 40,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.5,
          },
          {
            id = "console",
            size = 0.5,
          },
        },
        position = "bottom",
        size = 10,
      },
    },
    mappings = {
      edit = "e",
      open = "o",
      repl = "r",
      toggle = "t",
      remove = "d",
      expand = { "<Tab>" },
    },
  },

  keys = {
    { "<leader>dz", m.toggle, desc = "Toggle nvim-dap-ui" },
  },
}
