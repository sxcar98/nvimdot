local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

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
	command = "/opt/homebrew/anaconda3/envs/itcast/bin/python3",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	{
		name = "Launch Python file",
		type = "python",
		request = "launch",
		program = "${file}",
		pythonPath = "/opt/homebrew/anaconda3/envs/itcast/bin/python3",
	},
}

local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, opts) -- F5 Continue
vim.keymap.set("n", "<S-F5>", function()
	require("dap").terminate()
end, opts) -- Shift+F5 Stop
vim.keymap.set("n", "<F6>", function()
	require("dap").toggle_breakpoint()
end, opts) -- F9 Toggle Breakpoint
vim.keymap.set("n", "<F7>", function()
	require("dap").step_over()
end, opts) -- F10 Step Over
vim.keymap.set("n", "<F8>", function()
	require("dap").step_into()
end, opts) -- F11 Step Into
vim.keymap.set("n", "<S-F8>", function()
	require("dap").step_out()
end, opts) -- Shift+F11 Step Out
vim.keymap.set("n", "<F9>", function()
	require("dap").pause()
end, opts) -- F6 Pause
vim.keymap.set("n", "<leader>dr>", function()
	require("dap").repl.open()
end, opts) -- <leader>dr REPL
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end, opts) -- <leader>dl Run Last
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle({})
end, opts) -- <leader>du Toggle UI
