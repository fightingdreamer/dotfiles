-- Navigate and manipulate file system.

local compare_fs_entries = function(a, b)
  -- Put directory first.
  if a.is_dir and not b.is_dir then
    return true
  end
  if not a.is_dir and b.is_dir then
    return false
  end

  -- Otherwise order alphabetically ignoring case.
  return a.lower_name < b.lower_name
end

local dir_last_sort = function(fs_entries)
  -- Sort ignoring case.
  local res = vim.tbl_map(function(x)
    return {
      fs_type = x.fs_type,
      name = x.name,
      path = x.path,
      lower_name = x.name:lower(),
      is_dir = x.fs_type ~= "directory",
    }
  end, fs_entries)

  -- Sort based on default order.
  table.sort(res, compare_fs_entries)

  return vim.tbl_map(function(x)
    return { name = x.name, fs_type = x.fs_type, path = x.path }
  end, res)
end

return {
  "nvim-mini/mini.files",

  version = "*",

  opts = {
    content = {
      -- sort = dir_last_sort,
    },
  },

  keys = {
    { "-", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", desc = "Oil", { buffer = true } },
  },
  cmd = {
    "MiniFiles",
  },
}
