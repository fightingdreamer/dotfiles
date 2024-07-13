local function opts()
  return {
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
      },
    },
  }
end

local function config(_, opts)
  require("spectre").setup(opts)
end

local function replace_current_word()
  require("spectre").open_visual { select_word = true }
end

local function replace_selection()
  require("spectre").open_visual()
end

local function replace_in_file()
  require("spectre").open_file_search { select_word = true }
end

return {
  -- Find the enemy and replace them with dark power
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  version = false,
  config = config,
  opts = opts,
  keys = {
    { "<leader>S", replace_current_word, mode = "n", desc = "Spectre: search current word" },
    { "<leader>S", replace_selection, mode = "v", desc = "Spectre: search current word" },
    { "\\S", replace_in_file, mode = "n", desc = "Spectre: search in current file" },
  },
  cmd = "Spectre",
}
