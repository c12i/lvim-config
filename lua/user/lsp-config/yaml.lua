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
					-- Kubernetes schemas
					["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/apis__apps_v1.json"] = {
						"/*deployment*.yaml",
						"/*deployment*.yml",
					},
					["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/apis__v1.json"] = {
						"/*service*.yaml",
						"/*service*.yml",
						"/*configmap*.yaml",
						"/*configmap*.yml",
						"/*secret*.yaml",
						"/*secret*.yml",
					},
					["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/apis__networking.k8s.io_v1.json"] = {
						"/*ingress*.yaml",
						"/*ingress*.yml",
					},
					["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/apis__batch_v1.json"] = {
						"/*job*.yaml",
						"/*job*.yml",
						"/*cronjob*.yaml",
						"/*cronjob*.yml",
					},
					["https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/apis__autoscaling_v2.json"] = {
						"/*hpa*.yaml",
						"/*hpa*.yml",
						"/*horizontalpodautoscaler*.yaml",
						"/*horizontalpodautoscaler*.yml",
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
