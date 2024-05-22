local api = vim.api

api.nvim_create_user_command('W', ':w', {})
api.nvim_create_user_command('Q', ':qall!', {})
