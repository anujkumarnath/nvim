local nvchad_defaults = require "nvchad.configs.gitsigns"

local function merge(table1, table2)
		local result = {}

		for k, v in pairs(table1) do
				result[k] = v
		end

		for k, v in pairs(table2) do
				result[k] = v
		end

		return result
end

local overrides = {
		current_line_blame = true, -- Enable inline blame
		current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- Place the blame text at the end of the line
				delay = 500, -- Delay in ms before showing the blame
				ignore_whitespace = false, -- Ignore whitespace when showing blame
		},
		current_line_blame_formatter = ' <author>, <author_time:%R> - <summary>',
		numhl = true,
		word_diff = false,
		-- linehl = true,
}

-- Fetch the current theme's comment color and apply it to GitSignsCurrentLineBlame
local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })

if comment_hl and comment_hl.fg then
		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = comment_hl.fg })
end

-- vim.api.nvim_set_hl(0, "GitSignsChangeLn", { italic = true })

return merge(nvchad_defaults, overrides)
