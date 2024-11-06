-- Keymap util
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim fugitive keymaps
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gc", ":Git commit<CR>")
map("n", "<leader>gp", ":Git push<CR>")

-- Telescope keymaps
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")

-- Spectre keymaps
map("n", "<c-s>", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })

-- foldclose keymaps
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr" -- alts: "sytax" or "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
lvim.keys.normal_mode["<leader>z"] = ":foldclose<CR>"
lvim.keys.normal_mode["<leader>zz"] = ":foldopen<CR>"

-- undotree keymaps
lvim.keys.normal_mode["<leader>U"] = ":UndotreeToggle<CR>"

-- Todo keymaps
lvim.keys.normal_mode["<leader>tt"] = ":TodoTelescope<CR>"
lvim.keys.normal_mode["<leader>tl"] = ":TodoLocList<CR>"

-- Glow markdown preview keymaps
lvim.keys.normal_mode["<leader>md"] = ":Glow<CR>"
