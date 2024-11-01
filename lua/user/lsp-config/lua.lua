-- Lua LSP setup

local M = {}
M.setup = function()
	-- Configure the Lua formatter (stylua)
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{
			command = "stylua",
			filetypes = { "lua" },
		},
	})

	-- Configure Lua language server
	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					-- Setup lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize globals
					globals = {
						"vim",
						"lvim",
					},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
				-- LSP features configuration
				completion = {
					enable = true,
					callSnippet = "Replace",
				},
			},
		},
		-- Configure capabilities
		capabilities = require("lvim.lsp").common_capabilities(),
		-- Add custom on_attach function
		on_attach = function(client, bufnr)
			require("lvim.lsp").common_on_attach(client, bufnr)
		end,
	})
end
return M
