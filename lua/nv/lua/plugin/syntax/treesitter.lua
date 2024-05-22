local ensure_installed = {
    "bash",
    "c", "cmake", "cpp", "css", "csv",
    "diff",
    "fish",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "gpg", "graphql",
    "html", "http",
    "ini",
    "java", "javascript", "jq", "json", "json5", "jsonc",
    "kdl",
    "lua", "luap",
    "make", "markdown", "meson",
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

local opts = function()
    return {
        ensure_installed = ensure_installed,
        highlight = {
            enable = true,
            disable = {
                -- lang name
            },
            additional_vim_regex_highlighting = false,
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
                init_selection = false,   -- "gnn"
                node_incremental = false, -- "grn"
                node_decremental = false, -- "grm"
                scope_incremental = false,
            },
        },
    }
end

local config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return {
    "nvim-treesitter/nvim-treesitter",
    config = config,
    build = ":TSUpdate",
    event = {
        "BufNewFile",
        "BufReadPost",
    },
    opts = opts,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
}
