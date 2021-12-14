local o = vim.o
local g = vim.g

-- leader key
g.mapleader = ' '   -- use <space> as <leader>

-- tab key
o.tabstop = 2
o.softtabstop = -1  -- refer to shiftwidth
o.shiftwidth = 0    -- refer to tabstop

o.expandtab = true  -- use space instead tab

o.autoindent = true -- reproduce the indentation of the previous line

-- line number
o.number = true

-- no wrap
o.wrap = false

-- color scheme
o.termguicolors = true

-- no show '-- INSERT --'
o.showmode = false

o.swapfile = false
o.splitbelow = true
o.splitright = true
o.colorcolumn = '80'
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'

-- global variables (g:)
--vim.api.nvim_set_var("sonokai_style", "default")
--vim.api.nvim_set_var("sonokai_style", "atlantis")
vim.api.nvim_set_var("sonokai_style", "andromeda")
--vim.api.nvim_set_var("sonokai_style", "shusia")
--vim.api.nvim_set_var("sonokai_style", "maia")
--vim.api.nvim_set_var("sonokai_style", "espresso")

