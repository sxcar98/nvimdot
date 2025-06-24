local lint = require("lint")
local autocmd = vim.api.nvim_create_autocmd

lint.linters_by_ft = {
	cpp = { "cpplint" },
	c = { "cpplint" },
	lua = { "luacheck" },
	rust = { "clippy" },
	json = { "jsonlint" },
	python = { "flake8" },
	javascript = { "eslint" },
	typescript = { "eslint" },
	go = { "golangcilint" },
}

autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
