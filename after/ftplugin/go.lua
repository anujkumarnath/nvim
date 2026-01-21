-- Disable all syntax highlighting for Go files
vim.opt_local.syntax = "off"
vim.bo.syntax = ""
vim.cmd("syntax clear")
vim.schedule(function()
	pcall(vim.treesitter.stop)
	vim.cmd("syntax off")
end)
