vim.cmd([[
	filetype plugin indent on
]])

local options = {
  clipboard = "unnamedplus", -- allow neovim to access the system clipboard

  -- indention
  autoindent = true, -- auto indentation
  expandtab = true,  -- convert tabs to spaces
  shiftwidth = 2,    -- the number of spaces inserted for each indentation
  smartindent = true, -- make indenting smarter
  softtabstop = 2,   -- when hitting <BS>, pretend like a tab is removed, even if spaces
  tabstop = 2,       -- insert 2 spaces for a tab

  -- search
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  wildmenu = true,  -- make tab completion for files/buffers act like bash

  -- ui
  cursorline = true, -- highlight the current line

  mouse = "",        -- mouse disabled
  number = true,     -- set numbered lines
  scrolloff = 18,    -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 3, -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  splitbelow = true, -- open new split below
  splitright = true, -- open new split to the right
  wrap = false,      -- display a long line

  -- autocomplete
  completeopt = "menuone,noselect,popup",

  -- theme
  termguicolors = true, -- enable 24-bit RGB colors

  -- persistent undo
  -- Don"t forget to create folder $HOME/.local/share/nvim/undo
  undofile = true, -- enable persistent undo
  undodir = vim.fn.stdpath("data") .. "/undo",
  undolevels = 1000,
  undoreload = 10000,
}

-- Disable builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for o, v in pairs(options) do
  vim.opt[o] = v
end

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Colorscheme
-- By default, use rose-pine
vim.cmd.colorscheme("tokyonight")
