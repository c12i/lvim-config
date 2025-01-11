-- Global LSP config

-- setup Prettier formatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		filetypes = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"html",
			"json",
			"yaml",
			"markdown",
			"graphql",
		},
	},
})

-- Enable tree-sitter matchup module for enhanced % navigation and highlighting
lvim.builtin.treesitter.matchup.enable = true

-- Enable diagnostic signs in the gutter
vim.diagnostic.config({
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
})

vim.lsp.inlay_hint.enable = true

-- Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
lvim.builtin.neo_tree = lvim.builtin.neo_tree or {}
lvim.builtin.neo_tree.config = lvim.builtin.neo_tree.config or {}
lvim.builtin.neo_tree.config.diagnostics = {
	enable = true,
	show_on_dirs = true,
	icons = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}
