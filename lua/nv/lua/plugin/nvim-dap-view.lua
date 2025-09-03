-- Visualize debugging sessions in neovim.

return {
  "igorlfs/nvim-dap-view",

  ---@module 'dap-view'
  ---@type dapview.Config
  opts = {},

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
