-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
      vim.keymap.set('n', '<c-s>', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {}
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {}
    end
  },
  -- {
  --   "folke/which-key.nvim",
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --     require("which-key").setup {}
  --   end
  -- },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  }
  --{
  --"andymass/vim-matchup",
  --event = "CursorMoved",
  --config = function()
  --vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --end,
  --},
}

lvim.colorscheme = "gruvbox"

lvim.format_on_save.enabled = true

-- general keybindings
lvim.keys.normal_mode["<C-t>"] = ":pop<cr>"

-- vim fugitive keybindings
lvim.keys.normal_mode["<leader>gs"] = ":Git<CR>"
lvim.keys.normal_mode["<leader>gc"] = ":Git commit<CR>"
lvim.keys.normal_mode["<leader>gp"] = ":Git push<CR>"

-- Telescope keybindings
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>fg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>fb"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<leader>fh"] = ":Telescope help_tags<CR>"
lvim.builtin.treesitter.matchup.enable = true

-- Trouble keybindings
lvim.keys.normal_mode["<leader>xx"] = "<cmd>TroubleToggle<cr>"
lvim.keys.normal_mode["<leader>xw"] = "<cmd>TroubleToggle workspace_diagnostics<cr>"
lvim.keys.normal_mode["<leader>xd"] = "<cmd>TroubleToggle document_diagnostics<cr>"
lvim.keys.normal_mode["<leader>xl"] = "<cmd>TroubleToggle loclist<cr>"
lvim.keys.normal_mode["<leader>xq"] = "<cmd>TroubleToggle quickfix<cr>"
lvim.keys.normal_mode["gR"] = "<cmd>TroubleToggle lsp_references<cr>"

-- prettier formatter
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql"
    },
  },
}
