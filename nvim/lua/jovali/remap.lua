vim.g.mapleader = " "

-- set keymaps --
local keymap = vim.keymap

-- File explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Nvim tree keymaps
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")


-- Remap window movement keys
keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true })
keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })

keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true })
keymap.set('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true })

-- Telescope keymaps (FuzzyFinder)
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
