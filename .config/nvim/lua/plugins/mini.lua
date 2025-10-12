return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })
			
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- Keybindings:
			--  - sa  - [S]urround [A]dd (e.g. saiw) to add surrounding to inner word)
			--  - sd  - [S]urround [D]elete (e.g. sd' to delete quotes)
			--  - sr  - [S]urround [R]eplace (e.g. sr)' to replace ) with ')
			--  - sf  - [S]urround [F]ind (to the right)
			--  - sF  - [S]urround [F]ind (to the left)
			--  - sh  - [S]urround [H]ighlight
			--  - sn  - [S]urround update [N]_lines
			require("mini.surround").setup()
			
			-- Add animations for common Neovim actions
			-- require("mini.animate").setup()

			
			-- Auto pairs for brackets, quotes, etc.
			require("mini.pairs").setup()
			
			-- Highlight and remove trailing whitespace
			require("mini.trailspace").setup()
			
			-- Automatic highlighting of word under cursor
			-- Highlights all occurrences of the word under the cursor
			require("mini.cursorword").setup()
			
			-- Git integration for statusline
			require("mini.git").setup()
			require("mini.diff").setup()
			
			-- Simple statusline without UTF-8 and cursor position
			require("mini.statusline").setup({
				use_icons = true,
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local filetype = vim.bo.filetype ~= '' and vim.bo.filetype or ''

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = 'MiniStatuslineDevinfo', strings = { git, diff } },
							'%<',
							{ hl = 'MiniStatuslineFilename', strings = { filename } },
							'%=',
							{ hl = 'MiniStatuslineFileinfo', strings = { filetype } },
						})
					end,
				},
			})
		end,
	},
}
