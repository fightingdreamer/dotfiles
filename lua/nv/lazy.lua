-- register path, hint: {path}/lua/c/lsp.lua -> require('c.lsp')
local root = vim.fn.stdpath "config" .. "/lua/nv"

-- setup mapleader
vim.g.mapleader = " "

local spec = {
  { import = "plugin.base" },
  { import = "plugin.comment" },
  { import = "plugin.completion" },
  -- { import = "plugin.debug" },
  { import = "plugin.deps" },
  { import = "plugin.editing" },
  { import = "plugin.format" },
  { import = "plugin.git" },
  -- { import = "plugin.help" },
  { import = "plugin.history" },
  { import = "plugin.icon" },
  { import = "plugin.lsp" },
  { import = "plugin.org" },
  { import = "plugin.navigation" },
  -- { import = "plugin.note" },
  { import = "plugin.syntax" },
  { import = "plugin.theme" },
  { import = "plugin.ui" },
}

local opts = {
  spec = spec,
  defaults = { lazy = true },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
    border = "rounded",
    backdrop = 100,
  },

  -- dev = {
  --     path = "~/Projects.forks"
  -- },

  performance = {
    rtp = {
      reset = true,
      paths = { root },
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },

  change_detection = {
    enabled = false,
    notify = true,
  },
}

-- plugin path
local path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- if not present
if not (vim.uv or vim.loop).fs_stat(path) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  -- clone from remote
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", path }
end

-- register path, hint: {path}/lua/lazy.lua -> require('lazy')
vim.opt.rtp:prepend(path)

-- setup
require("lazy").setup(opts)
