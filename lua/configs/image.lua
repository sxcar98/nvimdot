local image = require("image")

image.setup({
	backend = "sixel",
	integrations = {
		markdown = {
			only_render_image_at_cursor = true,
		},
	},
	window_overlap_clear_enabled = true,
})
