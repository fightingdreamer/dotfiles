local diagnostic = vim.diagnostic

diagnostic.config({
    virtual_text = false,
    underline = {
        severity = diagnostic.severity.ERROR,
    }
})
