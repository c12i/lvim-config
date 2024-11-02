-- YAML LSP customization

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure YAML LSP
	lspconfig.yamlls.setup({
		settings = {
			yaml = {
				schemas = {
					-- GitHub Actions schema
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
					-- GitLab CI schema
					["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
						"/.gitlab-ci.yml",
						".gitlab-ci.yml",
					},
				},
				validate = true,
				completion = true,
				hover = true,
				format = {
					enable = true,
				},
				customTags = {
					"!reference sequence", -- For GitLab CI !reference tags
					"!include mapping", -- For GitLab CI includes
				},
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})
end

return M
