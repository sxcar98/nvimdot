local sqls = require("sqls")

local options = {
	filetypes = { "sql", "mysql", "Dbee" },
	on_attach = function(client, bufnr)
		sqls.on_attach(client, bufnr)
	end,
	settings = {
		sqls = {
			connections = {
				{
					driver = "mysql",
					dataSourceName = "sxcar98:sxcar98@tcp(localhost:3306)/itcast",
				},
			},
		},
	},
}

return options
