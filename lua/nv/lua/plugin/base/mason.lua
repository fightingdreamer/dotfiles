local function ensure_pylsp_plugins(package, handle)
  local root_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/mason/packages/" .. package.name)
  local python_path = root_path .. "/venv/bin/python"
  local python_args = {
    "-m",
    "pip",
    "install",
    "--upgrade",
    "pylsp-rope",
    -- "python-lsp-black",
    -- "python-lsp-isort",
    "python-lsp-ruff",
    -- "pyls-memestra",  -- tracks @deprecated
    -- "pylsp-mypy", -- tracks types
  }

  local job = {
    cwd = root_path,
    args = python_args,
    command = python_path,
  }
  require("plenary.job"):new(job):start()
end

local function opts()
  return {
    ensure_installed = {
      -- web
      "biome",
      -- lua
      "lua-language-server",
      "selene",
      "stylua",
      -- python
      "pyright",
      "debugpy",
      "python-lsp-server",
      "jedi-language-server",
    },
    event_handlers = {
      ["python-lsp-server"] = {
        ["install:success"] = ensure_pylsp_plugins,
      },
    },

    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },

      keymaps = {
        toggle_package_expand = "<Tab>",
        toggle_server_expand = "<Tab>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 8,
  }
end

local info = vim.schedule_wrap(function(msg)
  vim.notify(msg, vim.log.levels.INFO)
end)

local warn = vim.schedule_wrap(function(msg)
  vim.notify(msg, vim.log.levels.WARN)
end)

local ensure = function(ensure_installed)
  local registry = require "mason-registry"
  for _, name in ipairs(ensure_installed) do
    local package = registry.get_package(name)
    if not package:is_installed() then
      package:once("install:success", function()
        info(string.format("%s: successfully installed", package.name))
      end)
      package:once("install:failed", function()
        warn(string.format("%s: failed to install", package.name))
      end)
      info(string.format("%s: installing...", package.name))
      package:install()
    end
  end
end

local events = function(event_handlers)
  local registry = require "mason-registry"
  for name, events in pairs(event_handlers) do
    local package = registry.get_package(name)
    for event_name, event_handler in pairs(events) do
      package:on(
        event_name,
        vim.schedule_wrap(function()
          info(string.format("%s: %s", package.name, event_name))
          event_handler(package)
        end)
      )
    end
  end
end

local config = function(_, opts)
  require("mason").setup(opts)
  vim.defer_fn(function()
    events(opts.event_handlers)
    ensure(opts.ensure_installed)
  end, 300)
end

return {
  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  "williamboman/mason.nvim",
  config = config,
  event = "VeryLazy",
  opts = opts,
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUpdate",
  },
}
