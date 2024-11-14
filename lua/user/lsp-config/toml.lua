-- TOML LSP customization
local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure Taplo LSP for TOML
	lspconfig.taplo.setup({
		settings = {
			-- Enable completion, validation and formatting
			enable_features = {
				format = {
					enable = true,
				},
				completion = {
					enable = true,
				},
				validation = {
					enable = true,
				},
			},
			-- Schema configurations
			schema = {
				-- Disable the default schema associations
				associations = {
					-- Disable default schema store
					[".*"] = "",
				},
				-- Configure specific schemas
				enabled = true,
				-- Add custom schema associations
				customAssociations = {
					[".*Cargo.toml"] = "https://taplo.tamasfe.dev/schemas/cargo.schema.json",
					[".*/[Ww]orkspace.*/Cargo.toml"] = "https://taplo.tamasfe.dev/schemas/cargo-workspace.schema.json",
					[".*/\\.cargo/config\\.toml"] = "https://taplo.tamasfe.dev/schemas/cargo-config.schema.json",
					[".*/rustfmt.toml"] = "https://taplo.tamasfe.dev/schemas/rustfmt.schema.json",
					[".*rust-toolchain.toml"] = "https://taplo.tamasfe.dev/schemas/rust-toolchain.schema.json",
				},
				-- Repository paths for schemas
				repositories = {
					"https://taplo.tamasfe.dev/schemas/",
				},
			},
			-- Taplo specific settings
			taplo = {
				-- Configuration for the Taplo language server
				config = {
					-- Format configuration
					formatting = {
						-- Formatting options
						alignEntries = false,
						alignComments = true,
						columnWidth = 80,
						indentTables = true,
						indentString = "    ", -- 4 spaces
						reorderKeys = false,
					},
				},
			},
		},
		-- Use the common capabilities from your Neovim setup
		capabilities = require("lvim.lsp").common_capabilities(),
		-- File patterns to watch
		filetypes = { "toml" },
	})
end

return M
