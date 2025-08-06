local prettier = { "prettierd", "prettier", stop_after_first = true }

local options = {
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		typescript = { "stylua" },
		yaml = { "stylua" },
		rust = { "rustfmt" },
		sql = { "sql_formatter" },
		Dbee = { "sql_formatter" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
}

return options
