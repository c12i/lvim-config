-- Svelte language server setup

local M = {}

M.setup = function()
	-- configure Svelte language server
	local lspconfig = require("lspconfig")

	lspconfig.svelte.setup({
		filetypes = { "svelte" },

		settings = {
			svelte = {
				plugin = {
					html = {
						completions = {
							enable = true,
							emmet = true,
						},
					},
					svelte = {
						completions = {
							enable = true,
						},
					},
					css = {
						completions = {
							enable = true,
							emmet = true,
						},
					},
				},
				-- Enable diagnostic messages
				diagnostics = {
					enable = true,
				},
				-- Enable format on save
				format = {
					enable = true,
				},
			},
		},
	})
end

return M
