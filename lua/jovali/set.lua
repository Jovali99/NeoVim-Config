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
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.cmd[[command! School :cd C:\\Users\\darki\\Documents\\Skol dokument]]
vim.cmd[[command! NvimConfig :cd C:\\Users\\darki\\Appdata\\Local\\nvim]]
vim.cmd[[command! Projekt :cd C:\\Users\\darki\\Projekt]]
vim.cmd[[command! LeetCode :cd C:\\Users\\darki\\Projekt\\Coding\\LeetCode]]
vim.cmd[[command! Jobb :cd C:\\Users\\darki\\Jobb]]

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

-- Function to check file type and execute command
function CheckAndExecute()
    -- Get the current buffer's file type
    local filetype = vim.bo.filetype
    local current_buffer_name = vim.fn.expand('%:p')

    -- Check the file type and execute command based on it
    if filetype == 'python' then
        vim.cmd('echo "Python file detected! Entering Python specific command."')
        -- Replace the echo command with your desired Python-specific command
        -- For example: vim.cmd('pythoncommand')
    elseif filetype == 'typescript' then
        -- Get the filename of the current buffer
        local filename = vim.fn.expand('%:t:r')
        -- Execute the command in the Neovim terminal
        local command = 'tsc ' .. filename .. '.ts && node ' .. filename .. '.js'
        vim.cmd('terminal ' .. command)
        --vim.cmd('edit ' .. current_buffer_name)
    elseif filetype == 'lua' then
        vim.cmd('echo "Lua file detected! Entering Lua specific command."')
        -- Replace the echo command with your desired Lua-specific command
        -- For example: vim.cmd('luacommand')
    else
        vim.cmd('echo "Unknown file type! No specific command."')
    end
end

-- Key mapping for <leader>f2 to trigger the function
vim.api.nvim_set_keymap('n', '<leader><F2>', ':lua CheckAndExecute()<CR>', { noremap = true, silent = true })

