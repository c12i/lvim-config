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

	-- Prevent mason-lspconfig from setting up rust-analyzer
	lvim.lsp.automatic_configuration.skipped_servers =
		vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

	-- Configure rustaceanvim
	vim.g.rustaceanvim = {
		server = {
			cmd = function()
				local mason_registry = require("mason-registry")
				local ra_binary = mason_registry.is_installed("rust-analyzer")
						and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
					or "rust-analyzer"
				return { ra_binary }
			end,
		},
	}
end

return M
