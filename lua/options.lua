require "nvchad.options"

local o = vim.o

o.cursorlineopt = 'both' -- to enable cursorline(matlab nahi pata)

-- For RGS
-- indentation
o.tabstop = 2 -- how tabs look
o.shiftwidth = 2 -- spaces used for autoindent or 'shift' + '>'
o.softtabstop = 2 --
o.expandtab = false -- /t -> #tabstop spaces

-- For Game
-- o.expandtab = true      -- Use spaces instead of tabs
-- o.shiftwidth = 4        -- Indent by 4 spaces
-- o.softtabstop = 4       -- Tab key inserts 4 spaces
-- o.tabstop = 2           -- Display width of a tab is 2 columns

o.foldmethod = 'indent'
o.foldlevel = 99

-- trailing whitespace highlight and auto remove on save
vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "red" })

local group = vim.api.nvim_create_augroup("TrailingWhitespace", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
		group = group,
		command = [[match TrailingWhitespace /\s\+\%#\@<!$/]],
})

vim.api.nvim_create_autocmd("InsertEnter", {
		group = group,
		command = [[match none]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
		group = group,
		command = [[%s/\s\+$//e]],
})

-- sharing clipboard with windows with wls
vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
}
