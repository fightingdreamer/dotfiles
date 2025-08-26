-- stylua: ignore start
local ensure_installed = {
    "bash",
    "c", "cmake", "cpp", "css", "csv",
    "diff",
    "fish",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "gpg", "graphql",
    "html", "http",
    "ini",
    "java", "javascript", "jq", "json", "json5", "jsonc",
    "jinja",
    "kdl",
    "lua", "luap",
    "make", "markdown", "markdown_inline", "meson",
    "nix",
    "objc",
    "pug", "python",
    "regex",
    "scss", "ssh_config", "svelte",
    "toml", "tsv", "tsx", "typescript", "vim",
    "vimdoc", "vue",
    "xml",
    "yaml",
    "zig",
}
-- stylua: ignore end

local opts = function()
  return {
    ensure_installed = ensure_installed,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "jinja" },
    },
    indent = {
      enable = true,
    },
    auto_install = true,
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    incremental_selection = {
      enable = true,
      disable = {
        -- lang name
      },
      keymaps = {
        init_selection = false, -- "gnn"
        node_incremental = false, -- "grn"
        node_decremental = false, -- "grm"
        scope_incremental = false,
      },
    },
  }
end

local config = function(_, opts)
  -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  -- parser_config.jinja2 = {
  --   install_info = {
  --     url = "https://github.com/theY4Kman/tree-sitter-jinja",
  --     files = { "src/parser.c", "src/scanner.c" },
  --   },
  -- }
  require("nvim-treesitter.configs").setup(opts)
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  build = ":TSUpdate",
  event = "UIEnter",
  opts = opts,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
}
