vim.g.mapleader = " "

-- set keymaps --
local keymap = vim.keymap

-- File explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<C-Q>', '<C-V>', { noremap = true })

--Nvim tree keymaps
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
--keymap.set('n', "<leader>et", '<C-e>')

-- Remap window movement keys
keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true })
keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })

keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true })
keymap.set('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true })

--Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Appending lines to above but keep cursor placement
vim.keymap.set("n", "J", "mzJ`z")

--Jump half page will keep cursor in the middle
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

--Keep cursor in middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Pasting over a highlighted word wont change register
vim.keymap.set("x", "<leader>p", [["_dP]])

--Yanking into clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
