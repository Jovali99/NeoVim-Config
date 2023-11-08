vim.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.cmd[[command! School :cd C:\\Users\\darki\\Documents\\Skol dokument]]
vim.cmd[[command! NvimConfig :cd C:\\Users\\darki\\Appdata\\Local\\nvim]]
vim.cmd[[command! Projekt :cd C:\\Users\\darki\\Projekt]]

-- Define a variable to store the saved working directory
vim.g.saved_cwd = ""

-- Function to save the current working directory
function ConfCurrentProject()
    local saved_cwd_file = vim.env.HOME .. '/.nvim_saved_cwd'
    local current_cwd = vim.fn.getcwd()
    vim.fn.writefile({current_cwd}, saved_cwd_file)
end

-- Function to change to the saved working directory
function CurrentProject()
    local saved_cwd_file = vim.env.HOME .. '/.nvim_saved_cwd'
    local saved_cwd = vim.fn.readfile(saved_cwd_file)[1]
    if saved_cwd and vim.fn.isdirectory(saved_cwd) == 1 then
        vim.fn.execute('cd ' .. saved_cwd)
    else
        print('Saved working directory not found or is invalid.')
    end
    end

-- Define commands for the functions
vim.cmd("command! ConfCurrentProject lua ConfCurrentProject()")
vim.cmd("command! CurrentProject lua CurrentProject()")
