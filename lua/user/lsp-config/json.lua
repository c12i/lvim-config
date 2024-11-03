-- JSON LSP setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure JSON LSP
	lspconfig.jsonls.setup({
		settings = {
			json = {
				schemas = {
					{
						fileMatch = { "package.json" },
						url = "https://json.schemastore.org/package.json",
					},
					{
						fileMatch = { "tsconfig.json", "tsconfig.*.json" },
						url = "https://json.schemastore.org/tsconfig.json",
					},
					{
						fileMatch = { ".eslintrc", ".eslintrc.json" },
						url = "https://json.schemastore.org/eslintrc.json",
					},
					{
						fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
						url = "https://json.schemastore.org/prettierrc.json",
					},
					{
						fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
						url = "https://json.schemastore.org/stylelintrc.json",
					},
				},
				validate = { enable = true },
				format = { enable = true },
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})

	-- Configure json file type settings
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "json", "jsonc" },
		callback = function()
			vim.opt_local.shiftwidth = 2
			vim.opt_local.tabstop = 2
			vim.opt_local.expandtab = true
		end,
	})
end

return M
