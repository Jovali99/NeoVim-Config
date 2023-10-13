return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                              , branch = '0.1.x',
      dependencies = { 
	  'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "BurntSushi/ripgrep",
	  },
	  config = function()
	  
  -- Telescope keymaps (FuzzyFinder)
  local builtin = require('telescope.builtin')
  local telescope = require("telescope")

  telescope.setup({
      defaults = {
          path_display = { "truncate " },
      },
  })
 telescope.load_extension('fzf')

  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
  vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    end,
}

