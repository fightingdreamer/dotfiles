local function opts()
  return {
    filetype = "md",
    root = "./journal",
    date_format = "%d/%m/%Y",
    journal = {
      format = "%Y/%m-%B/daily/%d-%A",
      template = "# %A %B %d %Y\n",
      frequency = { day = 1 },
      entries = {
        day = {
          format = "%Y/%m-%B/daily/%d-%A",
          template = "# %A %B %d %Y\n",
          frequency = { day = 1 },
        },
        week = {
          format = "%Y/%m-%B/weekly/week-%W",
          template = "# Week %W %B %Y\n",
          frequency = { day = 7 },
          date_modifier = "monday",
        },
        month = {
          format = "%Y/%m-%B/%B",
          template = "# %B %Y\n",
          frequency = { month = 1 },
        },
        year = {
          format = "%Y/%Y",
          template = "# %Y\n",
          frequency = { year = 1 },
        },
      },
    },
  }
end

return {
  "jakobkhansen/journal.nvim",
  opts = opts,
  cmd = "Journal",
}
