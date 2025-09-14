local dap = require("dap")
local widgets = require("dap.ui.widgets")

-- terminate dap buf when close ui
dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

dap.adapters.lldb = {
	type = "executable",
	command = "/Library/Developer/CommandLineTools/usr/bin/lldb-dap",
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch C++ program",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp

dap.adapters.python = {
	type = "executable",
	command = "/opt/homebrew/bin/python3",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	{
		name = "Launch Python file",
		type = "python",
		request = "launch",
		program = "${file}",
		pythonPath = "/opt/homebrew/bin/python3",
	},
}

local opts = { silent = true, noremap = true }
-- F5 Continue
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end, opts)
-- Shift+F5 Stop
vim.keymap.set("n", "<S-F5>", function()
	dap.terminate()
end, opts)
-- F6 Toggle Breakpoint
vim.keymap.set("n", "<F6>", function()
	dap.toggle_breakpoint()
end, opts)
-- F7 Step Over
vim.keymap.set("n", "<F7>", function()
	dap.step_over()
end, opts)
-- F8 Step Into
vim.keymap.set("n", "<F8>", function()
	dap.step_into()
end, opts)
-- Shift+F8 Step Out
vim.keymap.set("n", "<S-F8>", function()
	dap.step_out()
end, opts)
-- F9 Pause
vim.keymap.set("n", "<F9>", function()
	dap.pause()
end, opts)
