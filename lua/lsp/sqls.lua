local sqls = require("sqls")

local options = {
	filetypes = { "sql", "mysql", "Dbee" },
	on_attach = function(client, bufnr)
		sqls.on_attach(client, bufnr)
	end,
}

return options
