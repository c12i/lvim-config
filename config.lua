-- Root configurations
-- Docs: https://www.lunarvim.org/docs/configuration

-- Theme and colorscheme settings
lvim.colorscheme = "gruvbox"
vim.o.background = "dark" -- "light" or "dark"

-- Other general settings
vim.opt.relativenumber = true
lvim.format_on_save.enabled = true
lvim.builtin.cmp.enabled = true -- Enable auto-completion
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.lualine.sections.lualine_a = { -- Show mode in status line
	{ "mode", color = { gui = "bold" } },
}
-- Foldclose
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr" -- alts: "sytax" or "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Simple spellchecking
-- https://neovim.io/doc/user/spell.html
vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- Plugin management
require("user.plugins")

-- Keybindings
require("user.keymaps")

-- LSP and formatting
require("user.lsp")

-- Custom Telescope configuration
require("user.telescope").setup()

-- language specific LSP configurations
require("user.lsp-config.dockerfile").setup()
require("user.lsp-config.go").setup()
require("user.lsp-config.html").setup()
require("user.lsp-config.json").setup()
require("user.lsp-config.lua").setup()
require("user.lsp-config.nix").setup()
require("user.lsp-config.python").setup()
require("user.lsp-config.rust").setup()
require("user.lsp-config.svelte").setup()
require("user.lsp-config.terraform").setup()
require("user.lsp-config.toml").setup()
require("user.lsp-config.typescript").setup()
require("user.lsp-config.vimscript").setup()
require("user.lsp-config.vue").setup()
require("user.lsp-config.yaml").setup()
