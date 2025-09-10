local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = require("configs.tokyonight"),
	},
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		opts = require("configs.auto-dark-mode"),
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"echasnovski/mini.icons",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		configs = function()
			require("configs.tree")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("configs.lualine"),
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = require("configs.noice"),
		dependencies = {
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		opts = require("configs.gitsigns"),
	},
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			require("configs.fzf")
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		build = "cargo build --release",
		config = function()
			require("configs.blink")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		lazy = false,
		config = function()
			require("configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = {
			"markdown",
			"codecompanion",
		},
		lazy = true,
	},
	{
		"nanotee/sqls.nvim",
		lazy = true,
		ft = {
			"Dbee",
			"sql",
			"mysql",
		},
	},
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("configs.dbee")
		end,
	},
	{
		"milanglacier/minuet-ai.nvim",
		enabled = false,
		config = function()
			require("configs.minuet")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
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
		end,
	},
}

require("lazy").setup({
	spec = plugins,
	lockfile = vim.fn.stdpath("state") .. "/lazy/lock.json",
	rocks = {
		enabled = false,
	},
})
