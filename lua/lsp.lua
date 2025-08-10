local enable = vim.lsp.enable

local servers = {
	"clangd",
	"jsonls",
	"rust_analyzer",
	"lua_ls",
	"pyright",
	"sqls",
}

for _, lsp in ipairs(servers) do
	enable(lsp)
end
