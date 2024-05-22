local set = vim.keymap.set
local api = vim.api
local lsp = vim.lsp

lsp.inlay_hint.enable()

local function inlay_toggle()
  local enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not enabled)
end

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
  -- https://neovim.io/doc/user/lsp.html#lsp-api
  if client.supports_method "textDocument/rename" then
    set("n", "<leader>lR", vim.lsp.buf.rename, { buffer = bufnr, desc = "lsp rename" })
  end
  if client.supports_method "textDocument/inlayHint" then
    set("n", "<leader>lH", inlay_toggle, { buffer = bufnr, desc = "lsp inlay toggle" })
  end

  -- workspace
  -- set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = buf, desc = "lsp.add_workspace_folder" })
  -- set("n", "<leader>wl", vim_lsp_buf_list_workspace_folders, { buffer = buf, desc = "lsp.list_workspace_folders" })
  -- set("n", "<leader>wd", vim.lsp.buf.remove_workspace_folder, { buffer = buf, desc = "lsp.remove_workspace_folder" })
end

api.nvim_create_autocmd("LspAttach", { callback = lsp_attach })
