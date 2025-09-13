local options = {
	name = "basedpyright",
	cmd = { "basedpyright-langserver", "--stdio" },
	root_dir = vim.fs.root(0, { ".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" }),
	filetypes = { "python" },
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				diagnosticSeverityOverrides = {
					reportUnusedExpression = "none",
				},
			},
		},
	},
}

return options
