local function opts()
  return {}
end

local function config(_, opts)
  require("mini.trailspace").setup(opts)
end

local function trim()
  require("mini.trailspace").trim()
end

local function trim_last_lines()
  require("mini.trailspace").trim_last_lines()
end

return {
  -- Trim all trailing whitespace
  "echasnovski/mini.trailspace",
  version = false,
  config = config,
  keys = {
    { "<leader>d", trim, mode = "n", desc = "mini.trailspace trim trailing whitespace" },
    { "<leader>D", trim_last_lines, mode = "n", desc = "mini.trailspace trim last blank lines" },
  },
  opts = opts,
}
