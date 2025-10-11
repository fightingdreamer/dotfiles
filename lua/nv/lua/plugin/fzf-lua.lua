-- Improved fzf.vim written in lua.

local m = {
  buffers = function()
    require("fzf-lua").buffers {
      sort_lastused = false,
    }
  end,

  files = function()
    require("fzf-lua").files()
  end,

  files_all = function()
    require("fzf-lua").files {
      no_ignore = true,
      hidden = true,
    }
  end,

  oldfiles = function()
    require("fzf-lua").oldfiles {
      include_current_session = true,
      stat_file = true,
    }
  end,

  quickfix = function()
    require("fzf-lua").quickfix()
  end,

  blines = function()
    require("fzf-lua").blines()
  end,

  live_grep = function()
    require("fzf-lua").live_grep()
  end,

  live_grep_all = function()
    require("fzf-lua").live_grep {
      no_ignore = true,
      hidden = true,
    }
  end,

  live_grep_native = function()
    require("fzf-lua").live_grep_native()
  end,

  live_grep_native_all = function()
    require("fzf-lua").live_grep_native {
      no_ignore = true,
      hidden = true,
    }
  end,

  lsp_references = function()
    require("fzf-lua").lsp_references()
  end,

  lsp_definitions = function()
    require("fzf-lua").lsp_definitions()
  end,

  lsp_declarations = function()
    require("fzf-lua").lsp_declarations()
  end,

  lsp_typedefs = function()
    require("fzf-lua").lsp_typedefs()
  end,

  lsp_document_symbols = function()
    require("fzf-lua").lsp_document_symbols()
  end,

  lsp_live_workspace_symbols = function()
    require("fzf-lua").lsp_live_workspace_symbols()
  end,

  lsp_incoming_calls = function()
    require("fzf-lua").lsp_incoming_calls()
  end,

  lsp_outgoing_calls = function()
    require("fzf-lua").lsp_outgoing_calls()
  end,

  lsp_code_actions = function()
    require("fzf-lua").lsp_code_actions()
  end,

  jumps = function()
    require("fzf-lua").jumps()
  end,

  helptags = function()
    require("fzf-lua").helptags()
  end,

  manpages = function()
    require("fzf-lua").manpages()
  end,

  colorschemes = function()
    require("fzf-lua").colorschemes()
  end,

  diagnostics_document = function()
    require("fzf-lua").diagnostics_document()
  end,

  diagnostics_workspace = function()
    require("fzf-lua").diagnostics_workspace()
  end,
}

return {
  "ibhagwan/fzf-lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    local module = require "fzf-lua"
    module.setup(opts)
    module.register_ui_select()
  end,
  opts = {
    hls = {
      border = "Comment",
      help_border = "Comment",
      preview_border = "Comment",
    },
    fzf_opts = {
      ["--prompt"] = "❯ ",
      ["--pointer"] = "❯",
    },
    fzf_colors = true,
    winopts = {
      row = 0.5,
      width = 0.90,
      height = 0.80,
      backdrop = 100,
      preview = {
        vertical = "down:50%",
        horizontal = "right:50%",
        scrollbar = true,
        winopts = {
          number = false,
        },
      },
      on_create = function()
        vim.o.guicursor = (vim.o.guicursor or "") .. ",a:blinkon0"
      end,
      on_exit = function()
        vim.o.guicursor = vim.o.guicursor:gsub(",a:blinkon0", "")
      end,
    },
  },

  keys = {
    -- lsp
    { "<leader>lr", m.lsp_references,             desc = "Lsp references" },
    { "<leader>lD", m.lsp_declarations,           desc = "Lsp declarations" },
    { "<leader>ld", m.lsp_definitions,            desc = "Lsp definitions" },
    { "<leader>li", m.lsp_incoming_calls,         desc = "Lsp incoming calls" },
    { "<leader>lo", m.lsp_outgoing_calls,         desc = "Lsp outgoing calls" },
    { "<leader>la", m.lsp_code_actions,           desc = "Lsp code actions" },
    { "<leader>lt", m.lsp_typedefs,               desc = "Lsp type definitions" },
    { "<leader>ls", m.lsp_document_symbols,       desc = "Lsp document symbols" },
    { "<leader>lS", m.lsp_live_workspace_symbols, desc = "Lsp live workspace symbols" },

    -- nav
    { "<leader>e",  m.diagnostics_document,       desc = "Document diagnostics" },
    { "<leader>E",  m.diagnostics_workspace,      desc = "Worksapce diagnostics" },
    { "<leader>b",  m.buffers,                    desc = "Buffers" },
    { "<leader>r",  m.oldfiles,                   desc = "Oldfiles" },
    { "<leader>j",  m.jumps,                      desc = "Jumps" },
    { "<leader>g",  m.live_grep_native,           desc = "Live grep" },
    { "<leader>G",  m.live_grep_native_all,       desc = "Live grep (all)" },
    { "<leader>o",  m.files,                      desc = "Files" },
    { "<leader>O",  m.files_all,                  desc = "Files (all)" },

    -- buf
    { "<leader>/",  m.blines,                     desc = "Buffer lines" },

    -- doc
    { "<leader>h",  m.helptags,                   desc = "Help pages" },

    -- man
    { "<leader>m",  m.manpages,                   desc = "Man pages" },

    -- oth
    { "<leader>c",  m.colorschemes,               desc = "Color schemes" },
  },
  cmd = "FzfLua",
}
