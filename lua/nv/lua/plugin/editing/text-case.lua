local function _opts()
  return {
    default_keymappings_enabled = true,
    prefix = "gau",
  }
end

local function _config(_, opts)
  require("textcase").setup(opts)
end

local function Previewer(render)
  local fzf_lua_previewer_builtin = require "fzf-lua.previewer.builtin"

  local Previewer = fzf_lua_previewer_builtin.base:extend()

  function Previewer:new(o, opts, fzf_win)
    Previewer.super.new(self, o, opts, fzf_win)
    setmetatable(self, Previewer)
    return self
  end

  function Previewer:populate_preview_buf(entry_str)
    local tmpbuf = self:get_tmp_buffer()
    vim.api.nvim_buf_set_lines(tmpbuf, 0, -1, false, { render(entry_str) })
    self:set_preview_buf(tmpbuf)
    self.win:update_preview_scrollbar()
  end

  function Previewer:gen_winopts()
    local new_winopts = {
      wrap = false,
      number = false,
    }
    return vim.tbl_extend("force", self.winopts, new_winopts)
  end

  return Previewer
end

local _generic_rename = function(rename_funcname)
  local textcase = require "textcase"

  local options = {
    ["UPPER CASE"] = "to_upper_case",
    ["lower case"] = "to_lower_case",
    ["snake_case"] = "to_snake_case",
    ["dash-case"] = "to_dash_case",
    ["Title-Dash-Case"] = "to_title_dash_case",
    ["CONSTANT_CASE"] = "to_constant_case",
    ["dot.case"] = "to_dot_case",
    ["lomma,case"] = "to_comma_case",
    ["camelCase"] = "to_camel_case",
    ["PascalCase"] = "to_pascal_case",
    ["Title Case"] = "to_title_case",
    ["path/case"] = "to_path_case",
    ["Phrase case"] = "to_phrase_case",
  }

  local cword = vim.fn.expand "<cword>"
  local render = function(entry_str)
    local funcname = options[entry_str]
    return textcase.api[funcname](cword)
  end

  local fzf_lua = require "fzf-lua"
  fzf_lua.fzf_exec(vim.tbl_keys(options), {
    previewer = Previewer(render),
    actions = {
      ["default"] = function(selected)
        local label = selected[1]
        local case_type = options[label]
        textcase[rename_funcname](case_type)
      end,
    },
  })
end

local _current_word_rename = function()
  _generic_rename "current_word"
end

local _lsp_rename = function()
  _generic_rename "lsp_rename"
end

return {
  -- An all in one plugin for converting text case in Neovim
  "johmsalas/text-case.nvim",
  dependencies = { "ibhagwan/fzf-lua" },
  config = _config,
  opts = _opts(),
  keys = {
    { mode = { "n" }, "gt", _current_word_rename, desc = "Rename symbol." },
    { mode = { "n" }, "<leader>lc", _lsp_rename, desc = "Rename symbol." },
  },
  cmd = "Subs",
}
