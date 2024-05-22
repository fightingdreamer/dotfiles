local config = function(_, opts)
  -- dark
  vim.opt.background = "dark"
  vim.cmd.colorscheme "mellow"
end

return {
  "kvrohit/mellow.nvim",
  priority = 1000,
  config = config,
  lazy = false,
}
