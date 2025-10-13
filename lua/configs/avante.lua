local avante = require("avante")

local options = {
	providers = {
		deepseek = {
			__inherited_from = "openai",
			endpoint = "https://api.deepseek.com/v1",
			model = "deepseek-coder",
			api_key_name = "DEEPSEEK_API_KEY",
			timeout = 30000,
			max_tokens = 4096,
			extra_request_body = {
				temperature = 0.2,
				max_completion_tokens = 8192,
				reasoning_effort = "medium",
			},
		},
	},
	provider = "deepseek",
	auto_suggestions_provider = "deepseek",
}

avante.setup(options)
