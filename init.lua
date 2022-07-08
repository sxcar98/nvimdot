local pack = require("core.pack")
local core = require("core")
local vim = vim

core.createdir()
core.disable_distribution_plugins()
core.leader_map()

pack.ensure_plugins()
require("core.options")
require("core.mapping")
require("keymap")
require("core.event")
pack.load_compile()

vim.cmd([[colorscheme one-nvim]])
