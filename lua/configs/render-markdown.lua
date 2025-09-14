local render_markdown = require("render-markdown")

render_markdown.setup({
	file_types = {
		"markdown",
	},
	completions = {
		lsp = {
			enabled = true,
		},
	},
})
