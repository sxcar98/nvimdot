--supprese warning on lack of perl and ruby
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load default configurations and plugins
for _, source in ipairs({
	"plugins",
	"options",
	"keymaps",
	"autocmds",
	"lsp",
}) do
	local ok, fault = pcall(require, source)
	if not ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end
