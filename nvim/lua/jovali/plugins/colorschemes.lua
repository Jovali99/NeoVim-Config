return {
--  	"bluz71/vim-moonfly-colors",
--  	name = "moonfly",
--  	lazy = false,
--      priority = 1000,
--      config = function()
--      	  -- Lua initialization file
--            vim.g.moonflyTransparent = true
--      	  vim.cmd([[colorscheme moonfly]])
--      end,


        "sainnhe/edge",
        name = "Edge Dark",
        lazy = false,
        priority = 1000,
        config = function()
               vim.g.edge_style = "default"
               vim.g.edge_dim_foreground = 0
               vim.g.edge_float_style = 'dim'
               vim.g.edge_dim_inactive_windows = 1
               vim.g.edge_transparent_background = 1
              -- Lua initialization file
              vim.cmd([[colorscheme edge]])
              -- Set the background of the "Normal" highlight group to transparent
              --vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
              -- Set the background of the "NormalFloat" highlight group to transparent
              --vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
            end,

          -- "ellisonleao/gruvbox.nvim",
--         priority = 1000 ,
--          config = true,
--          --vim.o.background = "dark",
--          require("gruvbox").setup({
--              terminal_colors = true, -- add neovim terminal colors
--              undercurl = true,
--              underline = true,
--              bold = true,
--              italic = {
--                  strings = true,
--                  emphasis = true,
--                  comments = true,
--                  operators = false,
--                  folds = true,
--              },
--              strikethrough = true,
--              invert_selection = false,
--              invert_signs = false,
--              invert_tabline = false,
--              invert_intend_guides = false,
--              inverse = true, -- invert background for search, diffs, statuslines and errors
--              contrast = "", -- can be "hard", "soft" or empty string
--              palette_overrides = {},
--              overrides = {},
--              dim_inactive = false,
--              transparent_mode = false,
           --}),
            --vim.cmd([[colorscheme gruvbox]]),
}
