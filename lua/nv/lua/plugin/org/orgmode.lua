local function opts()
  return {
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
    mappings = {
      org = {
        org_global_cycle = false,
        org_agenda_show_help = false,
      },
    },
  }
end

local function config(_, opts)
  require("orgmode").setup(opts)
end

return {
  "nvim-orgmode/orgmode",
  config = config,
  opts = opts,
  ft = { "org" },
}
