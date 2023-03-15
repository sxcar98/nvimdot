return function()
	vim.g.one_nvim_transparent_bg = true
	local auto_dark_mode = require("auto-dark-mode")
	auto_dark_mode.setup({
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd("set background=dark")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
			vim.cmd("set background=light")
		end,
	})
	auto_dark_mode.init()
end
