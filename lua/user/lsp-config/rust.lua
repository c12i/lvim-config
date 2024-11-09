-- Rust settings

local M = {}

M.setup = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			-- 'gd' for some reason doesn't jump to definition as expected, instead it jumps to the import
			-- map 'gd' to use vim.lsp.buf.definition() for Rust files only
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
		end,
	})
end

return M
