-- Prisma LSP setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	lspconfig.prismals.setup({
		filetypes = { "prisma" },
		capabilities = require("lvim.lsp").common_capabilities(),
		on_attach = function(client, bufnr)
			require("lvim.lsp").common_on_attach(client, bufnr)
		end,
	})
end

return M
