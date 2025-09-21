local jupytext = require("jupytext")

local options = {
	style = "hydrogen",
	output_extension = "auto",
	force_ft = nil,
	custom_language_formatting = {},
}

jupytext.setup(options)
