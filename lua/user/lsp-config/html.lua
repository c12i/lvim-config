-- HTML language server setup

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

	-- Ensure LSP servers are installed
	vim.list_extend(lvim.lsp.installer.setup.ensure_installed, {
		"tailwindcss",
		"cssls",
		"emmet_ls",
	})

	-- CSS Language Server
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

	-- Tailwind CSS Language Server
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
		},
		init_options = {
			userLanguages = {
				typescript = "javascript",
				typescriptreact = "javascript",
			},
		},
		settings = {
			tailwindCSS = {
				emmetCompletions = true,
				validate = true,
			},
		},
	})

	-- Emmet LSP
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
					["bem.enabled"] = true,
				},
			},
		},
	})
end

return M
