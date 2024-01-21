return {
-----------------------------------moonfly-------------------------------------
--      "bluz71/vim-moonfly-colors",
--      name = "moonfly",
--      lazy = false,
--      priority = 1000,
--      config = function()
--            -- Lua initialization file
--            vim.g.moonflyTransparent = true
--            vim.cmd([[colorscheme moonfly]])
--      end,
--  }
-------------------------------------------------------------------------------

-----------------------------------edge----------------------------------------
--      "sainnhe/edge",
--      name = "Edge Dark",
--      lazy = false,
--      priority = 1000,
--      config = function()
--             vim.g.edge_style = "default"
--             vim.g.edge_dim_foreground = 0
--             vim.g.edge_float_style = 'dim'
--             vim.g.edge_dim_inactive_windows = 1
--             vim.g.edge_transparent_background = 1
--            -- Lua initialization file
--            vim.cmd([[colorscheme edge]])
--            -- Set the background of the "Normal" highlight group to transparent
--            --vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
--            -- Set the background of the "NormalFloat" highlight group to transparent
--            --vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
--          end,
--  }
-------------------------------------------------------------------------------

-----------------------------------Gruvbox-------------------------------------
--      "ellisonleao/gruvbox.nvim",
--      priority = 1000 ,
--      --vim.o.background = "dark",
--      config = function()
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
--              transparent_mode = true,
--          })
--          vim.cmd([[colorscheme gruvbox]])
--      end,
--  }
-------------------------------------------------------------------------------

-------------------------------------Kanagawa----------------------------------
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {},
                    all = {
                        ui = {
                            bg_gutter = "none",
                        }
                    }
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    TelescopePromptNormal = { bg = 'NONE' },
                    TelescopePromptBorder = { fg = theme.ui.bg_dim, bg = 'NONE' },
                    TelescopeResultsNormal = { fg = 'NONE', bg = 'NONE'},
                    TelescopeResultsBorder = { fg = theme.ui.bg_dim, bg = 'NONE' },
                    TelescopePreviewNormal = { bg = 'NONE' },
                    TelescopePreviewBorder = { bg = 'NONE', fg = theme.ui.bg_dim },

                }
            end,
            theme = "dragon",              -- Load "wave" theme when 'background' option is not set
            background = {               -- map the value of 'background' option to a theme
            dark = "wave",           -- try "dragon" !
            light = "dragon"
        },
        })
        vim.cmd([[colorscheme kanagawa]])
    end,
}
