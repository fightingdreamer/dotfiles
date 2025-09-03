local opts = function()
  return {
    delay = {
      info = 100,
      signature = 50,
      completion = 100,
    },
  }
end

local config = function(_, opts)
  require("mini.completion").setup(opts)
end

return {
  -- Autocompletion and signature help plugin.
  "echasnovski/mini.completion",
  version = "*",
  config = config,
  event = { "InsertEnter" },
  opts = opts,
}
