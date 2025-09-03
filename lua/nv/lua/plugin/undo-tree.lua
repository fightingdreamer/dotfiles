-- The undo history visualizer for vim.

return {
  "mbbill/undotree",

  init = function(_)
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 36
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_DiffCommand = "diff -u"
  end,

  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", mode = "n", desc = "Toggle undo tree" },
  },
  cmd = {
    "UndotreeToggle",
  },
}
