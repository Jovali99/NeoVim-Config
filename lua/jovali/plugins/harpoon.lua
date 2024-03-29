return {
    "ThePrimeagen/harpoon",
    dependencies = {
	  'nvim-lua/plenary.nvim',
  },
    config = function()
        local harpoon = require("harpoon")
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
    
        harpoon.setup({
            menu = {
                width = 100,
            }
        })

        vim.keymap.set("n", "<leader>ea", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>eh", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>ej", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>ek", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>el", function() ui.nav_file(4) end)
    end,
}
