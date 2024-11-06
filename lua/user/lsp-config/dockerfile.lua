-- Dockerfile LSP setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure Dockerfile LSP
	lspconfig.dockerls.setup({
		cmd = { "docker-langserver", "--stdio" },
		filetypes = { "dockerfile" },
		root_dir = lspconfig.util.root_pattern("Dockerfile", ".dockerignore", "docker-compose.yml"),
		settings = {
			docker = {
				formatter = {
					enable = true,
				},
				languageserver = {
					diagnostics = {
						enable = true,
					},
					completion = {
						enable = true,
					},
				},
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})

	-- Configure efm-langserver for Hadolint integration
	require("lvim.lsp.manager").setup("efm", {
		filetypes = { "dockerfile" },
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				dockerfile = {
					{
						-- Linting with Hadolint
						lintCommand = "hadolint --no-color -",
						lintStdin = true,
						lintFormats = {
							"%f:%l %m",
							"%f:%l:%c %m",
						},
						lintSource = "hadolint",
					},
				},
			},
		},
	})
end

return M
