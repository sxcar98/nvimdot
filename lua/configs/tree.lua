local tree = require("neo-tree")

local options = {
	window = {
		mappings = {
			["P"] = {
				"toggle_preview",
				config = {
					use_float = false,
					use_image_nvim = true,
					title = "Neo-tree Preview",
				},
			},
		},
	},
}

tree.setup(options)
