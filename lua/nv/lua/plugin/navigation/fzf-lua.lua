local _config = function()
  -- local actions = require("fzf-lua").actions
  require("fzf-lua").setup {
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
        scrollbar = false,
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
  }
end

local _fzf_buffers = function()
  require("fzf-lua").buffers()
end

local _fzf_files = function()
  require("fzf-lua").files()
end

local _fzf_files_all = function()
  require("fzf-lua").files {
    no_ignore = true,
    hidden = true,
  }
end

local _fzf_oldfiles = function()
  require("fzf-lua").oldfiles()
end

local _fzf_quickfix = function()
  require("fzf-lua").quickfix()
end

local _fzf_blines = function()
  require("fzf-lua").blines()
end

local _fzf_live_grep = function()
  require("fzf-lua").live_grep()
end

local _fzf_live_grep_all = function()
  require("fzf-lua").live_grep {
    no_ignore = true,
    hidden = true,
  }
end

local _fzf_live_grep_native = function()
  require("fzf-lua").live_grep_native()
end

local _fzf_live_grep_native_all = function()
  require("fzf-lua").live_grep_native {
    no_ignore = true,
    hidden = true,
  }
end

local _fzf_lsp_references = function()
  require("fzf-lua").lsp_references()
end

local _fzf_lsp_definitions = function()
  require("fzf-lua").lsp_definitions()
end

local _fzf_lsp_declarations = function()
  require("fzf-lua").lsp_declarations()
end

local _fzf_lsp_typedefs = function()
  require("fzf-lua").lsp_typedefs()
end

local _fzf_lsp_document_symbols = function()
  require("fzf-lua").lsp_document_symbols()
end

local _fzf_lsp_live_workspace_symbols = function()
  require("fzf-lua").lsp_live_workspace_symbols()
end

local _fzf_lsp_incoming_calls = function()
  require("fzf-lua").lsp_incoming_calls()
end

local _fzf_lsp_outgoing_calls = function()
  require("fzf-lua").lsp_outgoing_calls()
end

local _fzf_lsp_code_actions = function()
  require("fzf-lua").lsp_code_actions()
end

local _fzf_jumps = function()
  require("fzf-lua").jumps()
end

local _fzf_helptags = function()
  require("fzf-lua").helptags()
end

local _fzf_manpages = function()
  require("fzf-lua").manpages()
end

local _fzf_colorschemes = function()
  require("fzf-lua").colorschemes()
end

local _fzf_diagnostics_document = function()
  require("fzf-lua").diagnostics_document()
end

local _fzf_diagnostics_workspace = function()
  require("fzf-lua").diagnostics_workspace()
end

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = _config,
  enable = true,
  cmd = "FzfLua",
  keys = {
    -- lsp
    { "<leader>lr", _fzf_lsp_references, desc = "telescope lsp references" },
    { "<leader>lD", _fzf_lsp_declarations, desc = "telescope lsp definitions" },
    { "<leader>ld", _fzf_lsp_definitions, desc = "telescope lsp definitions" },
    { "<leader>li", _fzf_lsp_incoming_calls, desc = "telescope lsp incoming calls" },
    { "<leader>lo", _fzf_lsp_outgoing_calls, desc = "telescope lsp outgoing calls" },
    { "<leader>la", _fzf_lsp_code_actions, desc = "telescope lsp outgoing calls" },
    { "<leader>lt", _fzf_lsp_typedefs, desc = "telescope type definitions" },
    { "<leader>ls", _fzf_lsp_document_symbols, desc = "telescope lsp document symbols" },
    { "<leader>lS", _fzf_lsp_live_workspace_symbols, desc = "telescope lsp dynamic workspace references" },

    -- nav
    { "<leader>e", _fzf_diagnostics_document, desc = "Find in open buffers" },
    { "<leader>E", _fzf_diagnostics_workspace, desc = "Find in open buffers" },
    { "<leader>b", _fzf_buffers, desc = "Find in open buffers" },
    { "<leader>r", _fzf_oldfiles, desc = "Find in oldfiles" },
    { "<leader>j", _fzf_jumps, desc = "telescope jumplist" },
    { "<leader>g", _fzf_live_grep_native, desc = "Grep files" },
    { "<leader>G", _fzf_live_grep_native_all, desc = "Grep files" },
    { "<leader>o", _fzf_files, desc = "Find file" },
    { "<leader>O", _fzf_files_all, desc = "Find file" },

    -- buf
    { "<leader>/", _fzf_blines, desc = "Find in buffer" },

    -- doc
    { "<leader>h", _fzf_helptags, desc = "telescope help page" },

    -- man
    { "<leader>m", _fzf_manpages, desc = "Find man page" },

    -- cmd | ctrl-e to edit
    -- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "telescope command history" },

    -- oth
    { "<leader>c", _fzf_colorschemes, desc = "Colorschemes" },

    -- { "<leader>m", "<cmd>Telescope marks<cr>",                                             desc = "telescope find marks" },
    -- { "<leader>cm", "<cmd>Telescope git_commits<cr>",                                      desc = "telescope git commits" },
    -- { "<leader>gt", "<cmd>Telescope git_status<cr>",                                       desc = "telescope git status" },
    -- { "<leader>pt", "<cmd>Telescope terms<cr>",                                            desc = "telescope pick hidden term" },
  },
}
