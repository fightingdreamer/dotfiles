local load_temp_rg = function(f)
  local env = 'RIPGREP_CONFIG_PATH'
  local cached = vim.uv.os_getenv(env) or ''
  vim.uv.os_setenv(env, vim.fn.stdpath('config') .. '/rg/config')
  f()
  vim.uv.os_setenv(env, cached)
  -- vim.api.nvim_create_autocmd('User', {
  --   pattern = 'MiniPickStop',
  --   once = true,
  --   callback = function()
  --     vim.uv.os_setenv(env, cached)
  --   end,
  -- })
end

local m = {
  help = function()
    require('mini.pick').builtin.help{ default_split = "vertical" }
  end,

  files = function()
    require('mini.pick').builtin.files()
  end,

  all_files = function()
    if vim.fn.executable('rg') == 1 then
      load_temp_rg(function()
        require('mini.pick').builtin.files({ tool = 'rg' })
      end)
    else
      vim.notify('all_files requires rg', vim.log.levels.WARN)
    end
  end,

  grep_live = function()
    require('mini.pick').builtin.grep_live()
  end,

  grep_live_all = function()
    if vim.fn.executable('rg') == 1 then
      load_temp_rg(function()
        require('mini.pick').builtin.grep_live({ tool = 'rg' })
      end)
    else
      vim.notify('grep_live_all requires rg', vim.log.levels.WARN)
      return
    end
  end,

  buffers = function()
    require('mini.pick').builtin.buffers()
  end,

  buf_lines = function()
    require('mini.extra').pickers.buf_lines()
  end,

  old_files = function()
    require('mini.extra').pickers.oldfiles()
  end,

  jumps = function()
    require('mini.extra').pickers.list({ scope = 'jumplist' })
  end,

  quickfix = function()
    require('mini.extra').pickers.list({ scope = 'quickfix' })
  end,

  treesitter = function()
    require('mini.extra').pickers.treesitter()
  end,

  colorschemes = function()
    require('mini.extra').pickers.colorschemes()
  end,

  manpages = function()
    require('mini.extra').pickers.manpages()
  end,

  marks = function()
    require('mini.extra').pickers.marks()
  end,

  registers = function()
    require('mini.extra').pickers.registers()
  end,

  command_history = function()
    require('mini.extra').pickers.history({ scope = ':' })
  end,

  lsp_symbols = function()
    require('mini.extra').pickers.lsp({ scope = 'document_symbols' })
  end,

  lsp_workspace_symbols = function()
    require('mini.extra').pickers.lsp({ scope = 'workspace_symbols' })
  end,

  lsp_references = function()
    require('mini.extra').pickers.lsp({ scope = 'references' })
  end,

  lsp_definitions = function()
    require('mini.extra').pickers.lsp({ scope = 'definitions' })
  end,

  lsp_declarations = function()
    require('mini.extra').pickers.lsp({ scope = 'declarations' })
  end,

  lsp_type_definitions = function()
    require('mini.extra').pickers.lsp({ scope = 'type_definitions' })
  end,

  lsp_incoming_calls = function()
    require('mini.extra').pickers.lsp({ scope = 'incoming_calls' })
  end,

  lsp_outgoing_calls = function()
    require('mini.extra').pickers.lsp({ scope = 'outgoing_calls' })
  end,

  lsp_code_actions = function()
    require('mini.extra').pickers.lsp({ scope = 'code_actions' })
  end,

  diagnostic = function()
    require('mini.extra').pickers.diagnostic()
  end,

  diagnostic_all = function()
    require('mini.extra').pickers.diagnostic({ scope = 'all' })
  end,

  git_branches = function()
    require('mini.extra').pickers.git_branches()
  end,

  git_commits = function()
    require('mini.extra').pickers.git_commits()
  end,

  git_files = function()
    require('mini.extra').pickers.git_files()
  end,

  git_hunks = function()
    require('mini.extra').pickers.git_hunks()
  end,
}

return {
  "nvim-mini/mini.pick",

  dependencies = {
    { 'nvim-mini/mini.extra', version = false },
  },

  version = false,

  opts = {
  },

  keys = {
    -- lsp
    {'<leader>lr', m.lsp_references,        desc = "Lsp references"},
    {'<leader>lD', m.lsp_declarations,      desc = "Lsp declarations"},
    {'<leader>ld', m.lsp_definitions,       desc = "Lsp definitions"},
    {'<leader>li', m.lsp_incoming_calls,    desc = "Lsp incoming calls"},
    {'<leader>lo', m.lsp_outgoing_calls,    desc = "Lsp outgoing calls"},
    {'<leader>la', m.lsp_code_actions,      desc = "Lsp code actions"},
    {'<leader>lt', m.lsp_type_definitions,  desc = "Lsp type definitions"},
    {'<leader>ls', m.lsp_symbols,           desc = "Lsp document symbols"},
    {'<leader>lS', m.lsp_workspace_symbols, desc = "Lsp workspace symbols"},

    -- nav
    {'<leader>e',  m.diagnostic,            desc = "Diagnostics"},
    {'<leader>E',  m.diagnostic_all,        desc = "Diagnostics (all)"},
    {'<leader>b',  m.buffers,               desc = "Buffers"},
    {'<leader>r',  m.old_files,             desc = "Old files"},
    {'<leader>j',  m.jumps,                 desc = "Jumps"},
    {'<leader>q',  m.quickfix,              desc = "Quickfix"},
    {'<leader>g',  m.grep_live,             desc = "Grep live"},
    {'<leader>G',  m.grep_live_all,         desc = "Grep live (all)"},
    {'<leader>o',  m.files,                 desc = "Files"},
    {'<leader>O',  m.all_files,             desc = "Files (all)"},

    -- buf
    {'<leader>/',  m.buf_lines,             desc = "Buffer lines"},

    -- doc
    {'<leader>h',  m.help,                  desc = "Help pages"},

    -- man
    {'<leader>m',  m.manpages,              desc = "Man pages"},

    -- oth
    {'<leader>c',  m.colorschemes,          desc = "Color schemes"},
    {'<leader>t',  m.treesitter,            desc = "Treesitter"},
    {'<leader>:',  m.command_history,       desc = "Command history"},
  },

  event = "VeryLazy",
  enabled = false,
}
