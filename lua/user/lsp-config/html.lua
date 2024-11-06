-- Svelte language server setup

local M = {}

M.setup = function()
	-- configure Svelte language server
	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	-- tailwindcss
	vim.list_extend(lvim.lsp.installer.setup.ensure_installed, {
		"tailwindcss",
	})

	lspconfig.cssls.setup({
		capabilities = capabilities,
		settings = {
			css = {
				validate = true,
				completion = {
					completePropertyWithSemicolon = true,
					triggerPropertyValueCompletion = true,
				},
				hover = {
					documentation = true,
					references = true,
				},
			},
			scss = {
				validate = true,
				completion = {
					completePropertyWithSemicolon = true,
					triggerPropertyValueCompletion = true,
				},
				hover = {
					documentation = true,
					references = true,
				},
			},
			less = {
				validate = true,
				completion = {
					completePropertyWithSemicolon = true,
					triggerPropertyValueCompletion = true,
				},
				hover = {
					documentation = true,
					references = true,
				},
			},
		},
	})

	-- Configure Emmet for better HTML/CSS completion
	lspconfig.emmet_ls.setup({
		filetypes = {
			"html",
			"css",
			"sass",
			"scss",
			"less",
		},
		init_options = {
			html = {
				options = {
					-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					["bem.enabled"] = true,
				},
			},
		},
	})
end

return M
