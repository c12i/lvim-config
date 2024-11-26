-- Bash script LSP settings

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")
	lspconfig.bashls.setup({
		filetypes = { "sh", "bash", "zsh" },
		settings = {
			bashls = {
				-- Enable glob pattern expansion
				globPattern = true,
				-- Enable word based suggestions
				enableCompletion = true,
				-- Include parameters in suggestions
				includeAllWorkspaceSymbols = true,
				-- Additional features
				shellcheck = {
					enable = true, -- Enable shellcheck integration
				},
				explainshell = {
					enable = false, -- Optional: Enable explainshell.com integration
				},
				-- Path to custom shell interpreter
				interpretterPath = "bash", -- or "/bin/bash"
			},
		},
		-- Single file support without needing a root directory
		single_file_support = true,
	})
end

return M
