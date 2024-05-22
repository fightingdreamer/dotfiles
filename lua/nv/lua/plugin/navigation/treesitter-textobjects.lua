local opts = function()
    return {
        textobjects = {
            move = {
                enable = true,
                set_jumps = true,
                -- if/else
                -- loop
                goto_next = {
                    ["]c"] = "@conditional.outer",
                    ["]l"] = "@loop.outer",
                },
                goto_previous = {
                    ["[c"] = "@conditional.outer",
                    ["[l"] = "@loop.outer",
                },
                -- b
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[C"] = "@class.outer",
                },
                -- e
                goto_next_end = {
                    ["]f"] = "@function.outer",
                    ["]C"] = "@class.outer",
                },
                -- w
                goto_next_start = {
                    ["]F"] = "@function.outer",
                },
                -- ge
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["]a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["[a"] = "@parameter.inner",
                },
            },
            select = {
                enable = true,
                lookahead = true,
                -- note: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
                keymaps = {
                    -- conditional
                    ["as"] = { query = "@statement.outer", desc = "tree-sitter select outer statement" },
                    -- conditional
                    ["ic"] = { query = "@conditional.inner", desc = "tree-sitter select inner conditional" },
                    ["ac"] = { query = "@conditional.outer", desc = "tree-sitter select outer conditional" },
                    -- frame
                    ["ib"] = { query = "@frame.inner", desc = "tree-sitter select inner frame" },
                    ["ab"] = { query = "@frame.outer", desc = "tree-sitter select outer frame" },
                    -- loop
                    ["il"] = { query = "@loop.inner", desc = "tree-sitter select inner loop" },
                    ["al"] = { query = "@loop.outer", desc = "tree-sitter select outer loop" },
                    -- single param in function signature or function call
                    ["ia"] = { query = "@parameter.inner", desc = "tree-sitter select inner parameter" },
                    ["aa"] = { query = "@parameter.outer", desc = "tree-sitter select outer parameter" },
                    -- function body
                    ["if"] = { query = "@function.inner", desc = "tree-sitter select inner function" },
                    ["af"] = { query = "@function.outer", desc = "tree-sitter select outer function" },
                    -- class body
                    ["aC"] = { query = "@class.outer", desc = "tree-sitter select outer class" },
                    ["iC"] = { query = "@class.inner", desc = "tree-sitter select inner class" },
                },
                -- selection_modes = {
                -- v charwise, V linewise
                -- ['@parameter.inner'] = 'v',
                -- ['@parameter.outer'] = 'v',
                -- ['@function.inner'] = 'V',
                -- ['@function.outer'] = 'V',
                -- ['@class.inner'] = 'V',
                -- ['@class.outer'] = 'V',
                -- },
            },
        }
    }
end

local config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = config,
    keys = {
        -- swap
        { ']a', mode = { 'n', 'x' } },
        { '[a', mode = { 'n', 'x' } },
        -- cond
        { ']c', mode = { 'n', 'x' } },
        { '[c', mode = { 'n', 'x' } },
        -- loop
        { ']l', mode = { 'n', 'x' } },
        { '[l', mode = { 'n', 'x' } },
        -- func
        { ']f', mode = { 'n', 'x' } },
        { '[f', mode = { 'n', 'x' } },
        { ']F', mode = { 'n', 'x' } },
        { '[F', mode = { 'n', 'x' } },
        -- class
        { ']C', mode = { 'n', 'x' } },
        { '[C', mode = { 'n', 'x' } },
        -- visual inner/outer
        -- stmt
        { 'as', mode = { 'x' } },
        -- cond
        { 'ic', mode = { 'x' } },
        { 'ac', mode = { 'x' } },
        -- frame
        { 'ib', mode = { 'x' } },
        { 'ab', mode = { 'x' } },
        -- loop
        { 'il', mode = { 'x' } },
        { 'al', mode = { 'x' } },
        -- param
        { 'ia', mode = { 'x' } },
        { 'aa', mode = { 'x' } },
        -- func
        { 'if', mode = { 'x' } },
        { 'af', mode = { 'x' } },
        -- class
        { 'iC', mode = { 'x' } },
        { 'aC', mode = { 'x' } },
    },
    opts = opts,
}
