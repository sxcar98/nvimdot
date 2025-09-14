local peek = require("peek")

local function system_theme()
	local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
	local result = handle:read("*a")
	handle:close()

	if result:match("Dark") then
		return "dark"
	else
		return "light"
	end
end

local options = {
	app = "browser",
	theme = system_theme(),
}

peek.setup(options)

vim.api.nvim_create_user_command("MarkdownPreviewStart", require("peek").open, {})
vim.api.nvim_create_user_command("MarkdownPreviewStop", require("peek").close, {})
