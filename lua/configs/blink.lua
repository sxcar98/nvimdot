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
			-- "minuet",
		},
		-- providers = {
		-- 	minuet = {
		-- 		name = "minuet",
		-- 		module = "minuet.blink",
		-- 		async = true,
		-- 		-- Should match minuet.config.request_timeout * 1000,
		-- 		-- since minuet.config.request_timeout is in seconds
		-- 		timeout_ms = 3000,
		-- 		score_offset = 50, -- Gives minuet higher priority among suggestions
		-- 	},
		-- },
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
