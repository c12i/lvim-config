-- Python language server setup

local M = {}

M.setup = function()
	-- configure Svelte language server
	local lspconfig = require("lspconfig")
	local formatters = require("lvim.lsp.null-ls.formatters")

	-- Configure Pyright (Python LSP)
	lspconfig.pyright.setup({
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	lspconfig.ruff_lsp.setup({
		init_options = {
			settings = {
				--  extra CLI arguments for `ruff`
				args = {},
			},
		},
	})

	formatters.setup({
		{
			command = "black", --  black for python formatting
			filetypes = { "python" },
			extra_args = { "--line-length=88" }, --  line length as needed
		},
		{
			command = "isort", -- sort python imports
			filetypes = { "python" },
			extra_args = { "--profile", "black" }, -- make isort compatible with black
		},
	})

	-- configure linters
	local linters = require("lvim.lsp.null-ls.linters")
	linters.setup({
		{
			command = "ruff", -- Fast Python linter
			filetypes = { "python" },
		},
	})
end

return M
