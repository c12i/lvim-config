-- Glint LSP setup for Handlebars

local M = {}
M.setup = function()
  local lspconfig = require("lspconfig")
  -- Configure Glint for Handlebars files
  lspconfig.glint.setup({
    filetypes = { "handlebars", "hbs" },
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {
      glint = {
        -- Glint language server settings
        checkForErrors = true,
      },
    },
    -- Configure capabilities
    capabilities = require("lvim.lsp").common_capabilities(),
    -- Add custom on_attach function
    on_attach = function(client, bufnr)
      require("lvim.lsp").common_on_attach(client, bufnr)
    end,
  })

  -- Ensure Handlebars files are recognized
  vim.filetype.add({
    extension = {
      hbs = "handlebars",
    },
  })
end
return M
