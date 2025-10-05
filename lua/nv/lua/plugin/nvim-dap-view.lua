-- Visualize debugging sessions in neovim.

local m = {
  open = function()
    require("dap-view").open()
  end,

  close = function()
    require("dap-view").close()
  end,

  toggle = function()
    require("dap-view").toggle()
  end,

  add_expr = function(expr)
    require("dap-view").add_expr(expr)
  end,

  jump_to_view = function(view)
    require("dap-view").jump_to_view(view)
  end,

  show_view = function(view)
    require("dap-view").show_view(view)
  end,

  navigate = function(opts)
    require("dap-view").navigate(opts)
  end,
}

return {
  "igorlfs/nvim-dap-view",

  ---@module 'dap-view'
  ---@type dapview.Config
  opts = {},

  keys = {
    { "\\d", m.toggle, mode = { "n" }, desc = "Toggle dap view" },
  },

  cmd = {
    "DapViewOpen",
    "DapViewClose",
    "DapViewToggle",
    "DapViewWatch",
    "DapViewJump",
    "DapViewShow",
    "DapViewNavigate",
  },
}
