-- SQL language server setup

local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")
	local null_ls = require("null-ls")

	-- sqls for basic completion without connection
	lspconfig.sqls.setup({
		cmd = { "sqls" },
		filetypes = { "sql" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
	})

	-- SQLFluff for formatting with specific rules
	-- Rules reference: https://docs.sqlfluff.com/en/stable/rules.html
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.sqlfluff.with({
				extra_args = {
					"--dialect",
					"postgres",
					"--exclude-rules",
					"L003,L004,L006,L007,L008,L009,L010,L011,L012,L013,L014,L015,L016,L017,L018,L019,L020",
					"--rules",
					"L010", -- Capitals for keywords
				},
				args = function(params)
					return {
						"format",
						"--dialect",
						"postgres",
						"--nocolor",
						params.temp_path,
					}
				end,
			}),
		},
	})
end

return M
