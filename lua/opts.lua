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

