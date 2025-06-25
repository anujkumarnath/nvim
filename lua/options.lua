require "nvchad.options"

local o = vim.o

o.cursorlineopt = 'both' -- to enable cursorline(matlab nahi pata)

-- For RGS
-- indentation
-- o.tabstop = 2 -- how tabs look
-- o.shiftwidth = 2 -- spaces used for autoindent or 'shift' + '>'
-- o.softtabstop = 2 --
-- o.expandtab = false -- /t -> #tabstop spaces

-- For Game
o.expandtab = true      -- Use spaces instead of tabs
o.shiftwidth = 4        -- Indent by 4 spaces
o.softtabstop = 4       -- Tab key inserts 4 spaces
o.tabstop = 2           -- Display width of a tab is 2 columns

o.foldmethod = 'indent'
o.foldlevel = 99
