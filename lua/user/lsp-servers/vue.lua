-- Vue language server setup 

local M = {}

M.setup = function()
  --configure volar (vue lsp)
  local lspconfig = require('lspconfig')
  lspconfig.volar.setup({
    filetypes = { 'vue', 'json' },
    documentFeatures = {
      documentSymbol = true,
      documentColor = true,
      documentFormatting = {
        defaultPrintWidth = 100,
      },
      documentHighlight = true,
    },
  })
end

return M
