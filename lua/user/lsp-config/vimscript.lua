-- Vim script language server setup
local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure vim-language-server
	lspconfig.vimls.setup({
		settings = {
			vim = {
				diagnostic = {
					enable = true,
				},
				completion = {
					enable = true,
					ignoreCase = true,
				},
				hover = {
					enable = true,
				},
			},
		},
		flags = {
			debounce_text_changes = 150,
		},
	})
end

return M
