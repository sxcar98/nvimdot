local fzf = require("fzf-lua")

local options = {
	keymap = {
		builtin = {
			false,
		},
		fzf = {
			false,
			["ctrl-z"] = "abort",
			["ctrl-f"] = "half-page-down",
			["ctrl-b"] = "half-page-up",
		},
	},
	grep = {
		no_header = true,
	},
	fzf_colors = {
		true,
		["pointer"] = { "fg", "Exception" },
	},
	previewers = {},
}

fzf.setup(options)
