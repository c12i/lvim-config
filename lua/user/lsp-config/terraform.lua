-- Terraform language server setup

local M = {}

M.setup = function()
	-- configure Terraform LSP
	local lspconfig = require("lspconfig")

	lspconfig.terraformls.setup({
		cmd = { "terraform-ls", "serve" },
		filetypes = { "terraform", "tf", "terraform-vars", "hcl" },
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	})

	-- Configure formatting
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{
			command = "terraform_fmt",
			filetypes = {
				"terraform",
				"tf",
				"terraform-vars",
			},
		},
	})

	-- Add TreeSitter parser for HCL/Terraform
	lvim.builtin.treesitter.ensure_installed = {
		"hcl",
		"terraform",
	}
end

return M
