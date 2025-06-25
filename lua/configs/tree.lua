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

return options
