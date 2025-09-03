-- Setup mapleader.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- register path, hint: {path}/lua/c/lsp.lua -> require('c.lsp')
local root = vim.fn.stdpath "config" .. "/lua/nv"

-- Plugin path.
local path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- When not present.
if not (vim.uv or vim.loop).fs_stat(path) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  -- Clone from remote.
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", path }
end

-- Register path, resolution: require('lazy') -> {path}/lua/lazy.lua
vim.opt.rtp:prepend(path)

-- setup
require("lazy").setup {
  spec = {
    { import = "plugin" },
  },

  defaults = {
    lazy = true,
  },

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

  install = {
    colorscheme = { "duskfox" },
  },

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

-- Light theme.
-- vim.opt.background = "light"
-- vim.cmd.colorscheme "dayfox"

-- Dark theme.
vim.opt.background = "dark"
vim.cmd.colorscheme "duskfox"
