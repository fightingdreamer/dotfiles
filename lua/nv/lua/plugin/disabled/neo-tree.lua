local priorities = {
    -- ["index.html"] = 6,
    -- ["index.js"] = 6,
}

local sort_function = function(a, b)
    -- show files before subdirectories
    if a.type ~= b.type then
        return a.type == "file"
    end
    -- sort by priority if it possible
    if priorities[a.name] and priorities[b.name] then
        return priorities[a.name] > priorities[b.name]
    end
    -- if the priority is set for only one, then the
    -- one who has it set will be the first
    if priorities[a.name] or priorities[b.name] then
        return priorities[a.name] ~= nil
    end
    -- default path sort
    return a.path < b.path
end

local copy_name = function(state)
    local node = state.tree:get_node()
    if node then
        vim.fn.setreg("+", node.name)
        vim.notify("'" .. node.name .. "' copied to clipboard!")
    end
end

local copy_path = function(state)
    local node = state.tree:get_node()
    if node then
        vim.fn.setreg("+", node.path)
        vim.notify("Path to '" .. node.name .. "' copied to clipboard!")
    end
end

local opts = function()
    return {
        sort_function = sort_function,
        enable_git_status = false,
        enable_diagnostics = false,
        close_if_last_window = true,
        source_selector = {
            sources = {
                { source = "filesystem" },
                { source = "buffers" },
                -- { source = "git_status" },
            },
        },
        filesystem = {
            find_by_full_path_words = true,
        },
        window = {
            width = 60,
            auto_expand_width = true,
            mappings = {
                ["m"] = "",
                ["y"] = copy_name,
                ["Y"] = copy_path,
                ["c"] = "copy_to_clipboard",
                ["t"] = "none",
                ["w"] = "none",
                ["S"] = "none",
                ["l"] = "toggle_node",
                ["e"] = "expand_all_nodes",
                ["z"] = "close_all_nodes",
                ["s"] = "split_with_window_picker",
                ["v"] = "vsplit_with_window_picker",
                ["o"] = "open_with_window_picker",
                ["oc"] = "none",
                ["od"] = "none",
                ["og"] = "none",
                ["om"] = "none",
                ["on"] = "none",
                ["os"] = "none",
                ["ot"] = "none",
                ["<Tab>"] = "open_with_window_picker",
                ["<Space>"] = "none",
            },
        },
    }
end

local config = function(_, opts)
    require("neo-tree").setup(opts)
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "s1n7ax/nvim-window-picker",
        "MunifTanjim/nui.nvim",
        -- "nvim-tree/nvim-web-devicons",
    },
    config = config,
    opts = opts,
    keys = {
        { '<leader>e', '<cmd>Neotree toggle<cr>',                  mode = { 'n' } },
        { '<leader>E', '<cmd>Neotree toggle reveal_force_cwd<cr>', mode = { 'n' } },
    },
}
