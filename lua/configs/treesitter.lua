local treesitter = require("nvim-treesitter")
local options = {
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
		},
		highlight_current_scope = {
			enable = false,
		},
	},
}

treesitter.install({
	"c",
	"cpp",
	"python",
	"json",
	"yaml",
	"markdown",
	"html",
	"scss",
	"css",
	"vim",
	"lua",
	"bash",
	"sql",
})

treesitter.setup(options)
