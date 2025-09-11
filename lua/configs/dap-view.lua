local dap, dv = require("dap"), require("dap-view")
dap.listeners.before.attach["dap-view-config"] = function()
	dv.open()
end
dap.listeners.before.launch["dap-view-config"] = function()
	dv.open()
end
dap.listeners.before.event_terminated["dap-view-config"] = function()
	dv.close()
end
dap.listeners.before.event_exited["dap-view-config"] = function()
	dv.close()
end

local options = {
	winbar = {
		sections = {
			"watches",
			"scopes",
			"exceptions",
			"breakpoints",
			"threads",
			"repl",
			"console",
		},
	},
	auto_toggle = true,
}

dv.setup(options)
