local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--branch=stable",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "fd.plugins.navigation" },
        { import = "fd.plugins.debugging" },
        -- { import = "fd.plugins.testing" },
        { import = "fd.plugins.editing" },
        { import = "fd.plugins.syntax" },
        { import = "fd.plugins.themes" },
        { import = "fd.plugins.coding" },
        { import = "fd.plugins.lsp" },
        -- { import = "fd.plugins.git" },
        { import = "fd.plugins.ui" },
    },
    change_detection = {
        notify = false
    },
    defaults = {
        lazy = false,
    },
    dev = {
        path = "~/Projects.forks"
    }
})
