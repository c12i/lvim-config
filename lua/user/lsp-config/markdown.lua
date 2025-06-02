-- Markdown language server setup

local M = {}

M.setup = function()
	-- configure Markdown LSP (marksman)
	local lspconfig = require("lspconfig")

	lspconfig.marksman.setup({
		filetypes = { "markdown" },
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	})

	-- Configure formatting (Prettier for Markdown)
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{
			command = "prettier",
			filetypes = { "markdown", "mdx" }, -- optional: add mdx support if desired
		},
	})

	-- Add TreeSitter parser for Markdown
	lvim.builtin.treesitter.ensure_installed = {
		"markdown",
		"markdown_inline",
	}
end

return M
