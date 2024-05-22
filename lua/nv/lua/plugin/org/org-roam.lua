local function opts()
  return {
    directory = "~/orgfiles",
  }
end

local function config(_, opts)
  require("org-roam").setup(opts)
end

return {
  -- port of org-roam to neovim using orgmode.
  "chipsenkbeil/org-roam.nvim",
  dependencies = { "nvim-orgmode/orgmode" },
  config = config,
  opts = opts,
  cmd = { "RoamUpdate" },
}
