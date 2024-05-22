local M = {}

local map = vim.keymap.set
-- local conf = require("nvconfig").ui.lsp

-- export on_attach & capabilities
local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "lsp " .. desc }
  end

  -- map("n", "gD", vim.lsp.buf.declaration, opts "go to declaration")
  -- map("n", "gd", vim.lsp.buf.definition, opts "go to definition")
  -- map("n", "K", vim.lsp.buf.hover, opts "hover information")
  -- map("n", "gi", vim.lsp.buf.implementation, opts "go to implementation")
  -- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "show signature help")
  -- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "add workspace folder")
  -- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "remove workspace folder")

  -- map("n", "<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts "list workspace folders")

  -- map("n", "<leader>D", vim.lsp.buf.type_definition, opts "go to type definition")

  -- map("n", "<leader>ra", function()
  --   require "nvchad.lsp.renamer" ()
  -- end, opts "rename")

  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "code action")
  -- map("n", "gr", vim.lsp.buf.references, opts "show references")

  -- setup signature popup
  -- if conf.signature and client.server_capabilities.signatureHelpProvider then
  --   require("nvchad.lsp.signature").setup(client, bufnr)
  -- end
end

-- disable semanticTokens
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.config = function()
  -- require "nvchad.lsp"

  local lspconfig = require "lspconfig"
  local servers = { "html", "cssls" }

  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }
  end

  -- typescript
  lspconfig.tsserver.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

return M
