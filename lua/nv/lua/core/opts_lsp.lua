-- rename ----------------------------------------------------------------------

local lsp_priority = {
  rename = {
    -- python
    "pylsp",
    "pyright",
    -- "jedi_language_server",
  },
}

-- rename ----------------------------------------------------------------------

-- https://neovim.io/doc/user/lsp.html#lsp-api
local lsp_have_feature = {
  rename = function(client)
    return client.supports_method "textDocument/rename"
  end,
  inlay_hint = function(client)
    return client.supports_method "textDocument/inlayHint"
  end,
  code_action = function(client)
    return client.supports_method "textDocument/codeAction"
  end,
}

-- rename ----------------------------------------------------------------------

local function get_lsp_client_names(have_feature)
  local client_names = {}
  local attached_clients = vim.lsp.get_clients { bufnr = 0 }
  for _, client in ipairs(attached_clients) do
    if have_feature(client) then
      table.insert(client_names, client.name)
    end
  end
  return client_names
end

local function lsp_buf_rename(client_name)
  vim.lsp.buf.rename(nil, { name = client_name })
end

local function lsp_buf_rename_use_one(fallback)
  local client_names = get_lsp_client_names(lsp_have_feature.rename)
  if #client_names == 1 then
    lsp_buf_rename(client_names[1])
    return
  end
  if fallback then
    fallback()
  end
end

local function lsp_buf_rename_use_any(fallback)
  local client_names = get_lsp_client_names(lsp_have_feature.rename)
  for _, client_name in ipairs(client_names) do
    lsp_buf_rename(client_name)
    return
  end
  if fallback then
    fallback()
  end
end

local function lsp_buf_rename_use_select(fallback)
  local client_names = get_lsp_client_names(lsp_have_feature.rename)
  local prompt = "Select lsp client for rename operation"
  local function on_choice(client_name)
    if client_name then
      lsp_buf_rename(client_name)
      return
    end
    if fallback then
      fallback()
    end
  end
  vim.ui.select(client_names, { prompt = prompt }, on_choice)
end

local function lsp_buf_rename_use_priority(fallback)
  local client_names = get_lsp_client_names(lsp_have_feature.rename)
  for _, client_priority_name in ipairs(lsp_priority.rename) do
    for _, client_name in ipairs(client_names) do
      if client_priority_name == client_name then
        lsp_buf_rename(client_priority_name)
        return
      end
    end
  end
  if fallback then
    fallback()
  end
end

local function lsp_buf_rename_use_priority_or_any()
  lsp_buf_rename_use_one(function()
    lsp_buf_rename_use_priority(function()
      lsp_buf_rename_use_any()
    end)
  end)
end

local function lsp_buf_rename_use_priority_or_select()
  lsp_buf_rename_use_one(function()
    lsp_buf_rename_use_priority(function()
      lsp_buf_rename_use_select()
    end)
  end)
end

-- inlay hint ------------------------------------------------------------------

local lsp_enable_inlay_hint = true

-- inlay hint ------------------------------------------------------------------

local function toggle_inlay_hint()
  local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end

-- lsp attach ------------------------------------------------------------------

local function lsp_attach(args)
  local bufnr = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  -- server
  if client.server_capabilities.completionProvider then
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  end
  if client.server_capabilities.definitionProvider then
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
  end

  -- client
  if lsp_have_feature.code_action(client) then
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr, desc = "lsp rename" })
  end

  if lsp_have_feature.rename(client) then
    vim.keymap.set("n", "<leader>R", lsp_buf_rename_use_priority_or_select, { buffer = bufnr, desc = "lsp rename" })
  end

  if lsp_have_feature.inlay_hint(client) then
    if lsp_enable_inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
    vim.keymap.set("n", "\\h", toggle_inlay_hint, { buffer = bufnr, desc = "lsp inlay toggle" })
  end

  -- workspace
  -- set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = buf, desc = "lsp.add_workspace_folder" })
  -- set("n", "<leader>wl", vim_lsp_buf_list_workspace_folders, { buffer = buf, desc = "lsp.list_workspace_folders" })
  -- set("n", "<leader>wd", vim.lsp.buf.remove_workspace_folder, { buffer = buf, desc = "lsp.remove_workspace_folder" })
end

vim.api.nvim_create_autocmd("LspAttach", { callback = lsp_attach })
