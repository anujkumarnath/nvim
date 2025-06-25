return {
		{
				"stevearc/conform.nvim",
				-- event = 'BufWritePre', -- uncomment for format on save
				opts = require "configs.conform",
		},

		-- These are some examples, uncomment them if you want to see them work!
		{
				"neovim/nvim-lspconfig",
				config = function()
						require "configs.lspconfig"
				end,
		},

		{
				"nvim-treesitter/nvim-treesitter",
				opts = {
						ensure_installed = {
								"vim", "lua", "vimdoc",
								"html", "css"
						},
				},
		},

		{
				"lewis6991/gitsigns.nvim",
				event = "User FilePost",
				opts = function()
						return require "configs.gitsigns"
				end,
		},

		{
				"ntpeters/vim-better-whitespace"
		},

		{
				"lukas-reineke/indent-blankline.nvim",
		},
		{
				'krisajenkins/telescope-docker.nvim',
				event = 'VeryLazy',
				dependencies = {
						'nvim-telescope/telescope.nvim',
				},
				config = function()
						require('telescope').load_extension('telescope_docker')
						require('telescope_docker').setup {}
				end,

				-- Example keybindings. Adjust these to suit your preferences or remove
				--   them entirely:
				keys = {
						{
								'<Leader>dv',
								':Telescope telescope_docker docker_volumes<CR>',
								desc = '[D]ocker [V]olumes',
						},
						{
								'<Leader>di',
								':Telescope telescope_docker docker_images<CR>',
								desc = '[D]ocker [I]mages',
						},
						{
								'<Leader>dp',
								':Telescope telescope_docker docker_ps<CR>',
								desc = '[D]ocker [P]rocesses',
						},
				},
		},
}
