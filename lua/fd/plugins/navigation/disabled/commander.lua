return {
    -- Create and manage keybindings and commands in a more organized manner.
    {
        "FeiyouG/commander.nvim",
        event = 'VeryLazy',
        opts = {
            integration = {
                enable = false,
            },
            lazy = {
                enable = true,
                set_plugin_name_as_cat = true,
            }
        }
    },
}
