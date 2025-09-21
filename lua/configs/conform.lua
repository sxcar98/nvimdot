local conform = require("conform")

local prettier = { "prettierd", "prettier", stop_after_first = true }
conform.formatters.sql_formatter = {
	prepend_args = { "-l", "mysql" },
}

local options = {
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = prettier,
		html = prettier,
		javascript = prettier,
		json = prettier,
		lua = { "stylua" },
		python = { "isort", "black" },
		ipynb = { "black" },
		typescript = { "stylua" },
		yaml = { "stylua" },
		rust = { "rustfmt" },
		sql = { "sql_formatter" },
		Dbee = { "sql_formatter" },
	},
	format_on_save = {
		timeout_ms = 500,
	},
}

conform.setup(options)
