-- setup formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql"
    },
  },
}

lvim.builtin.treesitter.matchup.enable = true

-- Enable diagnostic signs in the gutter
vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    prefix = '●',
    source = "if_many",
  },
})

-- Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
lvim.builtin.neo_tree = lvim.builtin.neo_tree or {}
lvim.builtin.neo_tree.config = lvim.builtin.neo_tree.config or {}
lvim.builtin.neo_tree.config.diagnostics = {
  enable = true,
  show_on_dirs = true,
  icons = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}

