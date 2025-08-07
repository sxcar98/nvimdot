local dbee = require("dbee")

local options = {
	default_connection = "MacminiMySQLDB",
	sources = {
		require("dbee.sources").MemorySource:new({
			{
				name = "MacminiMySQLDB",
				type = "mysql",
				url = "sxcar98:sxcar98@tcp(localhost:3306)/itcast",
			},
		}),
	},
	drawer = {
		window_options = {},
		buffer_options = {},
		disable_help = true,
	},
	result = {
		window_options = {},
		buffer_options = {},
		page_size = 100,
		focus_result = false,
	},
	editor = {
		window_options = {},
		buffer_options = {},
	},
	call_log = {
		window_options = {},
		buffer_options = {},
	},
}

dbee.setup(options)
