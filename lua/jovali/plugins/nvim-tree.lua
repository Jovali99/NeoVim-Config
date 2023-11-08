return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 45,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
                dotfiles = true,
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            update_focused_file = {
                enable = true
            },
            sync_root_with_cwd = true,

		})
end,
}
