-- Typescript language server setup

local M = {}

M.setup = function()
	-- configure TypeScript language server
	local lspconfig = require("lspconfig")
	local tstools = require("typescript-tools")

	-- Configure emmet-ls for JSX tag completion
	lspconfig.emmet_ls.setup({
		filetypes = {
			"typescriptreact",
			"javascriptreact",
		},
		init_options = {
			html = {
				options = {
					["jsx.enabled"] = true,
				},
			},
		},
	})

	tstools.setup({
		on_attach = function(client, bufnr)
			require("lvim.lsp.utils").common_on_attach(client, bufnr)

			-- override gd
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>TSToolsGoToSourceDefinition<CR>",
				{ buffer = bufnr, desc = "Go to source def" }
			)

			-- <leader>oi → organize imports
			vim.keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>", {
				buffer = bufnr,
				noremap = true,
				silent = true,
				desc = "Organize Imports",
			})
		end,
		settings = {
			expose_as_code_action = { "organize_imports", "remove_unused" },
			tsserver_plugins = {},
			complete_function_calls = true,
			separate_diagnostic_server = true,
		},
	})
end

return M
