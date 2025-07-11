local function opts()
  return {
    -- paths
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
    -- config
    org_startup_folded = "showeverything",
    org_startup_indented = false,
    org_adapt_indentation = false,
    -- mapping
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
