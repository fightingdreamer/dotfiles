-- rename ----------------------------------------------------------------------

local lsp_priority_for_rename = {
  -- python
  "pyright",
  "pylsp",
  "jedi_language_server",
}

-- rename ----------------------------------------------------------------------

local function get_lsp_client_names_for_rename()
  local client_names = {}
  for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
    if client.server_capabilities.completionProvider then
      table.insert(client_names, client.name)
    end
  end
  return client_names
end

local function lsp_buf_rename(client_name)
  if client_name then
    vim.lsp.buf.rename(nil, { name = client_name })
  end
end

local function lsp_buf_rename_use_first()
  local client_names = get_lsp_client_names_for_rename()
  for _, client_name in ipairs(client_names) do
    lsp_buf_rename(client_name)
    return true
  end
  return false
end

local function lsp_buf_rename_use_select()
  local client_names = get_lsp_client_names_for_rename()
  local prompt = "Select lsp client for rename operation"
  vim.ui.select(client_names, { prompt = prompt }, lsp_buf_rename)
end

local function lsp_buf_rename_use_priority()
  local client_names = get_lsp_client_names_for_rename()
  for _, client_priority_name in ipairs(lsp_priority_for_rename) do
    for _, client_name in ipairs(client_names) do
      vim.notify(client_name)
      if client_priority_name == client_name then
        lsp_buf_rename(client_priority_name)
        return true
      end
    end
  end
end

local function lsp_buf_rename_use_priority_or_first()
  if lsp_buf_rename_use_priority() then
    return true
  end
  if lsp_buf_rename_use_first() then
    return true
  end
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

  -- https://neovim.io/doc/user/lsp.html#lsp-api
  -- client
  if client.supports_method "textDocument/rename" then
    vim.keymap.set("n", "<leader>lR", lsp_buf_rename_use_priority_or_first, { buffer = bufnr, desc = "lsp rename" })
  end

  if client.supports_method "textDocument/inlayHint" then
    if lsp_enable_inlay_hint then
      vim.lsp.inlay_hint.enable()
    end
    vim.keymap.set("n", "<leader>th", toggle_inlay_hint, { buffer = bufnr, desc = "lsp inlay toggle" })
  end

  -- workspace
  -- set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = buf, desc = "lsp.add_workspace_folder" })
  -- set("n", "<leader>wl", vim_lsp_buf_list_workspace_folders, { buffer = buf, desc = "lsp.list_workspace_folders" })
  -- set("n", "<leader>wd", vim.lsp.buf.remove_workspace_folder, { buffer = buf, desc = "lsp.remove_workspace_folder" })
end

vim.api.nvim_create_autocmd("LspAttach", { callback = lsp_attach })
