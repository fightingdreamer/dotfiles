local opts = function()
  return {
    defaults = {
      -- sort
      file_sorter = require("mini.fuzzy").get_telescope_sorter,
      generic_sorter = require("mini.fuzzy").get_telescope_sorter,
      -- look
      entry_prefix = " ",
      prompt_prefix = " > ",
      selection_caret = " ",
      -- logic
      path_display = { "filename_first" },
      sorting_strategy = "ascending",
      -- layout
      color_devicons = true,
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      -- mapping
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
  }
end

local config = function(_, opts)
  require("telescope").setup(opts)
end

local oldfiles = function()
  local builtin = require "telescope.builtin"
  local sorters = require "telescope.sorters"
  builtin.oldfiles {
    sorter = sorters.get_substr_matcher(),
    --   tiebreak = function(a, b, _)
    --     return a.index < b.index
    --   end,
  }
end

local live_grep_git = function()
  local root = string.gsub(vim.fn.system "git rev-parse --show-toplevel", "\n", "")
  local builtin = require "telescope.builtin"
  if vim.v.shell_error == 0 then
    builtin.live_grep { cwd = root }
  end
end

local live_grep_below = function()
  local utils = require "telescope.utils"
  local builtin = require "telescope.builtin"
  builtin.live_grep {
    cwd = utils.buffer_dir(),
  }
end

local find_files_below = function()
  local utils = require "telescope.utils"
  local builtin = require "telescope.builtin"
  builtin.find_files {
    cwd = utils.buffer_dir(),
    follow = true,
    hidden = true,
    no_ignore = true,
  }
end

local current_buffer_subsrt_matcher = function()
  local builtin = require "telescope.builtin"
  local sorters = require "telescope.sorters"
  builtin.current_buffer_fuzzy_find {
    sorter = sorters.get_substr_matcher(),
    -- sorter = sorters.get_fuzzy_file(),
    -- sorter = sorters.get_generic_fuzzy_sorter(),
  }
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "echasnovski/mini.fuzzy",
    "nvim-treesitter/nvim-treesitter",
  },
  config = config,
  opts = opts,
  keys = {
    -- lsp
    { "<leader>lr", "<cmd>Telescope lsp_references include_declaration=false<cr>", desc = "telescope lsp references" },
    { "<leader>li", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "telescope lsp incoming calls" },
    { "<leader>lo", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "telescope lsp outgoing calls" },
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "telescope lsp definitions" },
    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "telescope type definitions" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "telescope lsp document symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "telescope lsp workspace references" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "telescope lsp dynamic workspace references" },
    { "<leader>lD", "<cmd>Telescope diagnostics bufnr=0 severity_limit=1 <cr>", desc = "telescope diagnostic" },

    -- nav
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "telescope find buffers" },
    { "<leader>r", oldfiles, desc = "telescope find oldfiles" },
    { "<leader>t", "<cmd>Telescope treesitter<cr>", desc = "telescope treesitter" },
    { "<leader>g", "<cmd>Telescope live_grep grep_open_files=true<cr>", desc = "telescope live grep" },
    { "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "telescope live grep" },
    -- { "<leader>o", "<cmd>git_files show_untracked=true<cr>", desc = "telescope live grep" },
    { "<leader>o", "<cmd>Telescope find_files follow=true<cr>", desc = "telescope find files" },
    { "<leader>O", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", desc = "telescope find all files" },

    -- buf
    { "<leader>/", current_buffer_subsrt_matcher, desc = "telescope find in current buffer" },

    -- doc
    { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "telescope help page" },

    -- man
    { "<leader>m", "<cmd>Telescope man_pages sections=1,5,8<cr>", desc = "telescope man pages" },

    -- cmd | ctrl-e to edit
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "telescope command history" },

    -- oth
    { "<leader>c", "<cmd>Telescope colorscheme<CR>", desc = "telescope colorschemes" },

    -- { "<leader>m", "<cmd>Telescope marks<cr>",                                             desc = "telescope find marks" },
    -- { "<leader>cm", "<cmd>Telescope git_commits<cr>",                                      desc = "telescope git commits" },
    -- { "<leader>gt", "<cmd>Telescope git_status<cr>",                                       desc = "telescope git status" },
    -- { "<leader>pt", "<cmd>Telescope terms<cr>",                                            desc = "telescope pick hidden term" },
  },
  cmd = "Telescope",
}
