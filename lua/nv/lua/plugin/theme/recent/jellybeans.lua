local config = function(_, opts)
  -- dark
  vim.opt.background = "dark"
  vim.cmd.colorscheme "jellybeans-nvim"
end

return {
  "metalelf0/jellybeans-nvim",
  dependencies = { "rktjmp/lush.nvim" },
  priority = 1000,
  config = config,
  lazy = false,
}
