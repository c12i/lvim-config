-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- General settings
lvim.colorscheme = "gruvbox"
lvim.format_on_save.enabled = true
-- enable auto-completion
lvim.builtin.cmp.enabled = true
lvim.builtin.nvimtree.setup.view.width = 35

-- Plugin management
require("user.plugins")

-- Keybindings
require("user.keymaps")

-- LSP and formatting
require("user.lsp")

-- Custom Telescope configuration
require("user.telescope").setup()

-- language specific LSP configurations
require("user.lsp-servers.typescript").setup()
