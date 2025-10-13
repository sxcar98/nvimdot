local blink = require("blink.cmp")

local options = {
	-- keymap = {
	-- 	["<A-y>"] = require("minuet").make_blink_map(),
	-- },
	completion = {
		documentation = {
			auto_show = true,
		},
		trigger = { prefetch_on_insert = false },
	},
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
			"avante",
			-- "minuet",
		},
		providers = {
			avante = {
				module = "blink-cmp-avante",
				name = "Avante",
			},
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
