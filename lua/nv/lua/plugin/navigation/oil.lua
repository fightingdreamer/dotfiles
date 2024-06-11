local opts = function()
  return {
    columns = {
      -- "size",
      "icon",
    },
    keymaps = {
      ["-"] = false,
      ["<CR>"] = false,
      ["<C-p>"] = false,
      ["<C-s>"] = false,
      ["<C-h>"] = false,
      ["<Tab>"] = "actions.select",
      ["<S-Tab>"] = "actions.parent",
      ["gs"] = "actions.select_split",
      ["gh"] = "actions.select_vsplit",
      ["K"] = "actions.preview",
    },
    view_options = {
      natural_order = true,
      sort = {
        { "type", "desc" },
        { "name", "asc" },
      },
    },
    preview = {
      min_width = { 10, 0.5 },
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
  }
end

local config = function(_, opts)
  require("oil").setup(opts)
end

return {
  "stevearc/oil.nvim",
  dependencies = {
    -- "nvim-tree/nvim-web-devicons",
  },
  config = config,
  opts = opts,
  keys = {
    { "<S-Tab>", "<cmd>Oil<cr>", desc = "Oil", { buffer = true } },
  },
  cmd = { "Oil" },
}
