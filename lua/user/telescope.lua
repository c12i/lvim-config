-- Telescope Configurations

local M = {}

M.setup = function()
	-- Disable the default keybindings
	lvim.builtin.which_key.mappings["f"] = {}
	lvim.builtin.which_key.mappings["s"]["t"] = {}

	-- Add new Telescope keybindings
	lvim.builtin.which_key.mappings["f"] = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		n = { "<cmd>enew<cr>", "New File" },
	}

	lvim.builtin.which_key.mappings["s"] = {
		name = "Search",
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
	}

	lvim.builtin.telescope.on_config_done = function(telescope)
		pcall(telescope.load_extension, "fzf")
	end
end

return M
