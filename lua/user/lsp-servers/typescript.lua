-- Typescript language server setup

local M = {}

M.setup = function()
  -- enable TypeScript language server
  lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "tsserver"
  end, lvim.lsp.automatic_configuration.skipped_servers)

  -- configure TypeScript language server
  local lspconfig = require('lspconfig')
  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      -- auto-imports
      -- client.resolved_capabilities.document_formatting = false
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        auto_inlay_hints = true,
        import_all_scan_buffers = 100,
        update_imports_on_move = true,
      })
      ts_utils.setup_client(client)
    end,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

return M
