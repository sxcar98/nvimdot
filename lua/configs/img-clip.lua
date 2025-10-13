local img_clip = require("img-clip")

local options = {
	default = {
		prompt_for_file_name = false,
		drag_and_drop = {
			insert_mode = true,
		},
		use_absolute_path = true,
	},
}

img_clip.setup(options)
