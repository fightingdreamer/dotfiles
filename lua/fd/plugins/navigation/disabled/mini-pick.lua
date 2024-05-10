local wipeout_cur = function()
    vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
end

return {
    {
        "echasnovski/mini.pick",
        version = false,
        opts = {
            mappings = {
                wipeout = { char = '<C-d>', func = wipeout_cur },
            }
        },
    },
}
