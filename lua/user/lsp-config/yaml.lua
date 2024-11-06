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
						"/.gitlab-ci.{yaml,yml}",
						".gitlab-ci.{yaml,yml}",
					},
					-- Kubernetes schemas
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.3-standalone-strict/deployment.json"] = {
						"**/deployment.{yaml,yml}",
						"**/*deployment*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.3-standalone-strict/service.json"] = {
						"**/service.{yaml,yml}",
						"**/*service*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.3-standalone-strict/ingress.json"] = {
						"**/ingress.{yaml,yml}",
						"**/*ingress*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.3-standalone-strict/configmap.json"] = {
						"**/configmap.{yaml,yml}",
						"**/*configmap*.{yaml,yml}",
					},
					-- Kustomize schema
					["https://json.schemastore.org/kustomization.json"] = "**/kustomization.{yaml,yml}",
					-- Helm chart schema
					["https://json.schemastore.org/chart.json"] = "**/Chart.yaml",
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
				schemaStore = {
					enable = false, -- Disable schemaStore to prevent automatic schema detection
				},
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})
end

return M
