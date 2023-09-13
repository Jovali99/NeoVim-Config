vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- set keymaps --
local keymap = vim.keymap

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

