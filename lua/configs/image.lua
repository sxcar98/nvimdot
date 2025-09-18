local image = require("image")

image.setup({
	backend = "sixel",
	integrations = {
		markdown = {
			only_render_image_at_cursor = true,
		},
		python = {
			only_render_image_at_cursor = true,
		},
	},
	max_width = 100,
	max_height = 20,
	max_height_window_percentage = math.huge,
	max_width_window_percentage = math.huge,
	window_overlap_clear_enabled = true,
})
