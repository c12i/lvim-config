-- Typescript language server setup

local M = {}

M.setup = function()
	-- enable TypeScript language server
	lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
		return server ~= "tsserver"
	end, lvim.lsp.automatic_configuration.skipped_servers)

	-- configure TypeScript language server
	local lspconfig = require("lspconfig")
	lspconfig.tsserver.setup({
		on_attach = function(client, _)
			-- auto-imports
			-- client.resolved_capabilities.document_formatting = false
			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({
				auto_inlay_hints = true,
				import_all_scan_buffers = 100,
				jsx_close_tag = true,
				jsx_attributes = true,
				diagnostic_on_save = true,
				import_on_completion = true,
				complete_parens = true,
				complete_function_calls = true,
				update_imports_on_move = true,
			})
			ts_utils.setup_client(client)
		end,
		flags = {
			debounce_text_changes = 150,
		},
		init_options = {
			preferences = {
				-- Improve JSX completion settings
				includeCompletionsForImportStatements = true,
				includeCompletionsWithSnippetText = true,
				includeAutomaticOptionalChainCompletions = true,
				includeCompletionsWithInsertText = true,
				autoImportSuggestions = true,
				-- Enable JSX attribute completions
				jsxAttributeCompletionStyle = "auto",
				-- Enable component prop completion
				generateReturnAnnotationInference = true,
				includeCompletionsWithClassMemberSnippets = true,
			},
			settings = {
				typescript = {
					suggest = {
						completeFunctionCalls = true,
						includeAutomaticOptionalChainCompletions = true,
						autoImports = true,
					},
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					suggest = {
						completeFunctionCalls = true,
						autoImports = true,
					},
				},
			},
			filetypes = {
				"typescript",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"javascript.jsx",
				"typescript.tsx",
			},
			plugins = {
				-- configure vue-typescript-plugin
				{
					name = "@vue/typescript-plugin",
					location = "~/.local/share/lvim/mason/packages/vue-language-server",
					languages = { "vue" },
				},
			},
		},
	})

	-- Configure emmet-ls for JSX tag completion
	lspconfig.emmet_ls.setup({
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"typescript",
		},
		init_options = {
			html = {
				options = {
					["jsx.enabled"] = true,
				},
			},
		},
	})
end

return M
