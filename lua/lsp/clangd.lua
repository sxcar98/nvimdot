local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
	capabilities = capabilities,
	filetypes = { "c", "cpp", "cc", "h", "hpp" },
}

return options
