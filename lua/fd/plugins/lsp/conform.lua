return {
    -- Lightweight yet powerful formatter plugin.
    {
        "stevearc/conform.nvim",
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim', },
        event = {
            'BufEnter',
            'BufWritePost',
        },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({
                        lsp_fallback = true,
                    })
                end,
                mode = { "n", "v" },
                desc = "Format Injected Langs",
            },
        },
        opts = {
            -- link: https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
            formatters = {
                pyflyby =
                {
                    stdin = true,
                    command = "tidy-imports",
                    args = function(self, ctx)
                        return { "--unaligned", "--quiet", "--print" }
                    end
                }
            },
            -- formatters = {
            --     eslint_d = {
            --         cwd = function()
            --             print("tset")
            --             return require("conform.util").root_file({
            --                 ".eslint.js",
            --                 ".eslint.cjs",
            --                 ".eslint.yaml",
            --                 ".eslint.json",
            --             })
            --         end,
            --         require_cwd = true
            --     }
            -- },
            formatters_by_ft = {
                -- note: run multiple formatters sequentially
                -- lang = { "a", "b" }
                -- note: run only first available formatter
                -- lang = { { "a", "b" } }
                sh = { "shfmt" },
                nix = { "alejandra", "nixfmt" },
                vue = {
                    -- { "biome" },
                    { "eslint" },
                    { "prettierd", "prettier", "eslint" },
                },
                json = { "jq" },
                bash = { "shfmt" },
                fish = { "fish_indent" },
                toml = { "taplo" },
                python = {
                    -- "pyflyby",
                    "isort",
                    "ruff_fix",
                    "ruff_format",
                },
                graphql = {
                    { "prettierd", "prettier" },
                },
                -- warn: use biome 
                javascript = {
                    -- { "biome" },
                    { "eslint" },
                    { "prettierd", "prettier" },
                },
                typescript = {
                    -- { "biome" },
                    { "eslint" },
                    { "prettierd", "prettier" },
                },
                typescriptreact = {
                    -- { "biome" },
                    { "eslint" },
                    { "prettierd", "prettier" },
                },
            },
            format_after_save = {
                lsp_fallback = false,
            },
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end
    }
}
