local stage_hunk = function()
    local gs = package.loaded.gitsigns
    gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
end

local reset_hunk = function()
    local gs = package.loaded.gitsigns
    gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
end

local blame_line = function()
    local gs = package.loaded.gitsigns
    gs.blame_line { full = true }
end

local diff_this = function()
    local gs = package.loaded.gitsigns
    gs.diffthis('~')
end

return {
    {
        'lewis6991/gitsigns.nvim',
        opts = function()
            return {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    -- Navigation
                    vim.keymap.set('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, buffer = bufnr, desc = 'Next change' })

                    vim.keymap.set('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, buffer = bufnr, desc = 'Prev change' })

                    -- Actions
                    -- vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr })
                    -- vim.keymap.set('v', '<leader>hs', stage_hunk, { buffer = bufnr })
                    -- vim.keymap.set('v', '<leader>hr', reset_hunk, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hb', blame_line, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>hD', diff_this, { buffer = bufnr })
                    -- vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })

                    -- Text object
                    -- vim.keymap.set({ 'o', 'x' }, 'ih', '<cmd>Gitsigns select_hunk<cr>')
                end
            }
        end,
    }
}
