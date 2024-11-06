-- TODO: needs more work
-- EditorConfig LSP setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure EditorConfig LSP
	lspconfig.editorconfig.setup({
		cmd = { "editorconfig-checker" },
		filetypes = { "editorconfig" },
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname)
		end,
		settings = {
			-- EditorConfig language server settings
			editorconfig = {
				-- Enable validation
				validate = true,
				-- Enable completion
				completion = true,
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})

	-- Set up filetype detection
	vim.filetype.add({
		pattern = {
			[".editorconfig"] = "editorconfig",
		},
	})
end

return M
