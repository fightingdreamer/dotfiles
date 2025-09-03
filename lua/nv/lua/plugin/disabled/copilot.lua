local function opts()
  return {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      -- javascript = true,
      -- typescript = true,
      python = true,
      ["*"] = false,
    },
  }
end

local function config(_, opts)
  require("copilot").setup(opts)
end

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = opts,
  event = "InsertEnter",
  config = config,
}
