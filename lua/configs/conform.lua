local conform = require("conform")
local prettier = { "prettierd", "prettier", stop_after_first = true }

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
		typescript = prettier,
		yaml = prettier,
		rust = { "rustfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
}

conform.setup(options)
