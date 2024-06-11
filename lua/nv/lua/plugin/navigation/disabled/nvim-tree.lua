local opts = function()
  return {
    live_filter = {
      always_show_folders = false,
    },
    respect_buf_cwd = true,
    sync_root_with_cwd = false,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
    },
    git = {
      enable = true,
    },
    filters = {
      git_ignored = true,
    },
    renderer = {
      icons = {
        show = {
          git = false,
          file = true,
          folder = true,
          folder_arrow = true,
          modified = false,
          bookmarks = true,
          diagnostics = false,
        },
      },
    },
    sort = {
      files_first = true,
    },
    view = {
      centralize_selection = true,
      width = 60,
    },
    ui = {
      confirm = {
        remove = true,
      },
    },
    -- on_attach = function (burnr)
    --     -- custom mapping here
    -- end
  }
end

local config = function(_, opts)
  require("nvim-tree").setup(opts)
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config,
  opts = opts,
  keys = {
    { "<leader>a", "<cmd>NvimTreeFindFileToggle!<cr>", mode = "n", desc = "nvim-tree find file" },
    { "<leader>A", "<cmd>NvimTreeFocus<cr>", mode = "n", desc = "nvim-tree focus" },
  },
}
