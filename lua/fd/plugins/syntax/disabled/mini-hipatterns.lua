return {
    -- Highlight patterns in text
    {
        "echasnovski/mini.hipatterns",
        version = false,
        event = "VeryLazy",
        opts = {
            highlighters = {
                note = { pattern = '%f[%w]()note()%f[%W]', group = 'MiniHipatternsNote' },
                todo = { pattern = '%f[%w]()todo()%f[%W]', group = 'MiniHipatternsTodo' },
                idea = { pattern = '%f[%w]()idea()%f[%W]', group = 'MiniHipatternsFixme' },
                hack = { pattern = '%f[%w]()hack()%f[%W]', group = 'MiniHipatternsHack' },
                warn = { pattern = '%f[%w]()warn()%f[%W]', group = 'MiniHipatternsFixme' },
            },
        }
    }
}
