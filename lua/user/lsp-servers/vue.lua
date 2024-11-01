-- Vue language server setup with enhanced features
local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  
  -- Configure Volar (Vue LSP)
  lspconfig.volar.setup({
    init_options = {
      vue = {
        hybridMode = false,
      }
    },
    settings = {
      volar = {
        autoImportComponent = true,
        autoCompleteRefs = true,
      },
      completion = {
        autoImportComponent = true,
      }
    }
  })
end

return M
