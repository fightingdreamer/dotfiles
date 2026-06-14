local m = {
  help_tags = function()
    local actions = require "telescope.actions"
    require("telescope.builtin").help_tags({
      sorter = require("telescope").extensions.fzy_native.sorter,
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", actions.select_vertical)
        map("n", "<CR>", actions.select_vertical)
        return true
      end,
    })
  end,

  find_files = function()
    require("telescope.builtin").find_files({
      follow = true,
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  find_all_files = function()
    require("telescope.builtin").find_files({
      follow = true,
      hidden = true,
      no_ignore = true,
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  find_files_below = function()
    require("telescope.builtin").find_files({
      cwd = require("telescope.utils").buffer_dir(),
      follow = true,
      hidden = true,
      no_ignore = true,
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  buffers = function()
    require("telescope.builtin").buffers({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  oldfiles = function()
    require("telescope.builtin").oldfiles({
      sorter = require("telescope.sorters").get_substr_matcher(),
    })
  end,

  live_grep = function()
    require("telescope.builtin").live_grep({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  live_grep_all = function()
    require("telescope.builtin").live_grep({
      hidden = true,
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  live_grep_git = function()
    local root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
    if vim.v.shell_error == 0 then
      require("telescope.builtin").live_grep({
        cwd = root,
        sorter = require("telescope").extensions.fzy_native.sorter,
      })
    end
  end,

  live_grep_below = function()
    require("telescope.builtin").live_grep({
      cwd = require("telescope.utils").buffer_dir(),
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  buf_lines = function()
    require("telescope.builtin").current_buffer_fuzzy_find({
      sorter = require("telescope.sorters").get_substr_matcher(),
    })
  end,

  jumps = function()
    require("telescope.builtin").jumplist({
      sorter = require("telescope.sorters").get_substr_matcher(),
    })
  end,

  quickfix = function()
    require("telescope.builtin").quickfix({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  treesitter = function()
    require("telescope.builtin").treesitter({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  colorschemes = function()
    require("telescope.builtin").colorscheme({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  manpages = function()
    require("telescope.builtin").man_pages({
      sections = { "1", "5", "8" },
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  command_history = function()
    require("telescope.builtin").command_history({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  marks = function()
    require("telescope.builtin").marks({
      sorter = require("telescope").extensions.fzy_native.sorter,
    })
  end,

  lsp_references = function()
    require("telescope.builtin").lsp_references({ include_declaration = false })
  end,

  lsp_definitions = function()
    require("telescope.builtin").lsp_definitions()
  end,

  lsp_declarations = function()
    require("telescope.builtin").lsp_declarations()
  end,

  lsp_type_definitions = function()
    require("telescope.builtin").lsp_type_definitions()
  end,

  lsp_document_symbols = function()
    require("telescope.builtin").lsp_document_symbols()
  end,

  lsp_workspace_symbols = function()
    require("telescope.builtin").lsp_dynamic_workspace_symbols()
  end,

  lsp_incoming_calls = function()
    require("telescope.builtin").lsp_incoming_calls()
  end,

  lsp_outgoing_calls = function()
    require("telescope.builtin").lsp_outgoing_calls()
  end,

  lsp_code_actions = function()
    require("telescope.builtin").lsp_code_actions()
  end,

  diagnostic = function()
    require("telescope.builtin").diagnostics({ bufnr = 0, line_width = 'full' })
  end,

  diagnostic_all = function()
    require("telescope.builtin").diagnostics({ line_width = 'full' })
  end,
}

return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
  },

  config = function(_, opts)
    require("telescope").setup(opts)
  end,

  opts = {
    defaults = {
      entry_prefix = " ",
      prompt_prefix = " > ",
      selection_caret = " ",
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
      sorting_strategy = "ascending",
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
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
    pickers = {
      jumplist = {
        sorter = require("telescope.sorters").get_substr_matcher(),
      },
      oldfiles = {
        sorter = require("telescope.sorters").get_substr_matcher(),
      },
    },
  },

  keys = {
    { "<leader>lr", m.lsp_references,         desc = "Lsp references" },
    { "<leader>lD", m.lsp_declarations,       desc = "Lsp declarations" },
    { "<leader>ld", m.lsp_definitions,        desc = "Lsp definitions" },
    { "<leader>li", m.lsp_incoming_calls,     desc = "Lsp incoming calls" },
    { "<leader>lo", m.lsp_outgoing_calls,     desc = "Lsp outgoing calls" },
    { "<leader>la", m.lsp_code_actions,       desc = "Lsp code actions" },
    { "<leader>lt", m.lsp_type_definitions,   desc = "Lsp type definitions" },
    { "<leader>ls", m.lsp_document_symbols,   desc = "Lsp document symbols" },
    { "<leader>lS", m.lsp_workspace_symbols,  desc = "Lsp workspace symbols" },

    { "<leader>t",  m.treesitter,             desc = "Treesitter" },
    { "<leader>e",  m.diagnostic,             desc = "Diagnostics" },
    { "<leader>E",  m.diagnostic_all,         desc = "Diagnostics (all)" },
    { "<leader>b",  m.buffers,                desc = "Buffers" },
    { "<leader>r",  m.oldfiles,               desc = "Old files" },
    { "<leader>j",  m.jumps,                  desc = "Jumps" },
    { "<leader>q",  m.quickfix,               desc = "Quickfix" },
    { "<leader>g",  m.live_grep,              desc = "Live grep" },
    { "<leader>G",  m.live_grep_all,          desc = "Live grep (all)" },
    { "<leader>o",  m.find_files,             desc = "Find files" },
    { "<leader>O",  m.find_all_files,         desc = "Find all files" },
    { "<leader>/",  m.buf_lines,              desc = "Buffer lines" },

    { "<leader>h",  m.help_tags,              desc = "Help pages" },
    { "<leader>m",  m.manpages,               desc = "Man pages" },

    { "<leader>c",  m.colorschemes,           desc = "Color schemes" },
    { "<leader>:",  m.command_history,        desc = "Command history" },
  },

  event = "VeryLazy",
}
