-- Go language server and tools setup
local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure gopls (Go Language Server)
	lspconfig.gopls.setup({
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		settings = {
			gopls = {
				-- Formatting options
				gofumpt = true, -- Enable stricter formatting

				-- Analysis features
				analyses = {
					unusedparams = true,
					shadow = true,
					fieldalignment = true,
					nilness = true,
					unusedwrite = true,
					useany = true,
				},

				-- Code completion settings
				usePlaceholders = true,
				completionDocumentation = true,
				deepCompletion = true,
				matcher = "fuzzy",

				-- Additional features
				staticcheck = true,
				experimentalPostfixCompletions = true,

				-- Import organization
				importShortcut = "Both", -- Keeps both package name and alias

				-- Hover settings
				hoverKind = "FullDocumentation",
				linkTarget = "pkg.go.dev",

				-- Code lens
				codelenses = {
					gc_details = true, -- Show garbage collector details
					generate = true, -- Show "go generate" details
					regenerate_cgo = true, -- Regenerate cgo
					tidy = true, -- Run go mod tidy
					upgrade_dependency = true,
					vendor = true,
				},

				-- Diagnostic settings
				diagnosticsDelay = "500ms",
				semanticTokens = true,
			},
		},
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})
end

return M
