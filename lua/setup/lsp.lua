-- setup lspconfig.
local capabilities = 
  require 'cmp_nvim_lsp'
    .update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_status = require 'lsp-status'
lsp_status.register_progress()

capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

-- rust analyzer
require 'lspconfig'.rust_analyzer.setup {
  on_attach = lsp_status.on_attach,
  capabilities = capabilities
}

