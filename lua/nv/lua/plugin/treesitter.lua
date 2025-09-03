-- Nvim Treesitter configurations and abstraction layer.

return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "csv",
      "diff",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gpg",
      "graphql",
      "html",
      "http",
      "ini",
      "java",
      "javascript",
      "jq",
      "json",
      "json5",
      "jsonc",
      "jinja",
      "kdl",
      "lua",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "meson",
      "nix",
      "objc",
      "pug",
      "python",
      "regex",
      "scss",
      "ssh_config",
      "svelte",
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      "zig",
    },
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
  },

  event = "VeryLazy",
}
