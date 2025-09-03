-- A soothing dark color scheme for neovim.

return {
  "kvrohit/mellow.nvim",

  init = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme "mellow"
  end,

  priority = 1000,
  lazy = false,
}
