local _config = function()
  require("coverage").setup {
    auto_reload = true,
  }
end

return {
  "andythigpen/nvim-coverage",
  version = "*",
  config = _config,
  cmd = "Coverage",
}
