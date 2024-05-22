local g = vim.g

local init = function()
  g.undotree_SetFocusWhenToggle = 1
  g.undotree_WindowLayout = 2
  g.undotree_SplitWidth = 36
  g.undotree_DiffAutoOpen = 0
  g.undotree_DiffCommand = "diff -u"
end

local opts = function()
  return {}
end

local config = function(_, opts) end

return {
  -- the undo history visualizer for vim
  "mbbill/undotree",
  config = config,
  opts = opts,
  init = init,
  keys = {
    { "<leader>;", "<cmd>UndotreeToggle<cr>", mode = "n", desc = "Undo tree" },
  },
  cmd = { "UndotreeToggle" },
}
