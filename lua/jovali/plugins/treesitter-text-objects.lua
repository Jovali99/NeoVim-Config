return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                lsp_interop = {
                    enable = true,
                    border = 'none',
                    floating_preview_opts = {},
                    peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dg"] = "@class.outer",
                    },
                },
            },
        })
    end,
}
