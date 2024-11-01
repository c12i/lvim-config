-- Nix LSP setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure nil (Nix LSP)
	lspconfig.nil_ls.setup({
		settings = {
			["nil"] = {
				-- Nix language server settings
				formatting = {
					command = { "nixpkgs-fmt" },
				},
				diagnostics = {
					-- Enable all diagnostics
					enables = true,
					unusedBindings = true,
					undeclaredVarUsage = true,
				},
				-- NIX LSP features configuration
				completion = {
					enable = true,
					triggers = { ".", " " },
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
