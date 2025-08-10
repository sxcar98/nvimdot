local blink = require("blink.cmp")

local options = {
	completion = {
		documentation = {
			auto_show = true,
		},
	},
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
		per_filetype = {
			cpp = {
				"lsp",
				"path",
				"buffer",
			},
			hpp = {
				"lsp",
				"path",
				"buffer",
			},
			cc = {
				"lsp",
				"path",
				"buffer",
			},
			h = {
				"lsp",
				"path",
				"buffer",
			},
		},
	},
}

blink.setup(options)
